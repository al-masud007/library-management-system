package com.example.library_management_FE;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @GetMapping("/")
    public String dashboard() {
        return "dashboard";
    }

    @GetMapping("/books")
    public String getBooks(Model model) {
        String apiUrl = "http://localhost:8081/api/books";
        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                apiUrl,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Map<String, Object>>>() {

                }
        );

        List<Map<String, Object>> books = response.getBody();
        model.addAttribute("books", books);

        return "books"; // your JSP page
    }

    @PostMapping("/add")
    public String addBook(@RequestParam String bookName,
                          @RequestParam String bookAuthor,
                          @RequestParam int quantity,
                          Model model, RedirectAttributes redirectAttributes) {

        // Validate quantity
        if (quantity <= 0) {
            redirectAttributes.addFlashAttribute("apiMessage", "Quantity must be greater than 0.");
            return "redirect:/";
        }

        RestTemplate restTemplate = new RestTemplate();
        Map<String, Object> newBook = new HashMap<>();
        newBook.put("bookName", bookName);
        newBook.put("bookAuthor", bookAuthor);
        newBook.put("quantity", quantity);

        String apiMessage = "";

        try {
            // Post to backend API
            ResponseEntity<Map> responseEntity = restTemplate.postForEntity(
                    "http://localhost:8081/api/books/add",
                    newBook,
                    Map.class
            );

            Map response = responseEntity.getBody();

            if (response != null && response.containsKey("message")) {
                apiMessage = response.get("message").toString(); // get message from API
            } else {
                apiMessage = "Book added successfully!";
            }

        } catch (Exception e) {
            // If backend returns 400 or any error
            if (e instanceof org.springframework.web.client.HttpClientErrorException.BadRequest) {
                String responseBody = ((org.springframework.web.client.HttpClientErrorException.BadRequest) e).getResponseBodyAsString();
                // You can parse JSON message if needed
                apiMessage = responseBody; // raw JSON message, or parse to get "message"
            } else {
                apiMessage = "Failed to add book. Check backend API.";
            }
        }

        redirectAttributes.addFlashAttribute("apiMessage", apiMessage);

        return "redirect:/books";
    }

    @PostMapping("/borrow/{id}")
    public String borrowBook(@PathVariable Long id, Model model) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.postForEntity("http://localhost:8081/api/books/" + id + "/borrow", null, Map.class);
        return "redirect:/books";
    }

    @PostMapping("/return/{id}")
    public String returnBook(@PathVariable Long id, Model model) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.postForEntity("http://localhost:8081/api/books/" + id + "/return", null, Map.class);
        return "redirect:/books";
    }
}



