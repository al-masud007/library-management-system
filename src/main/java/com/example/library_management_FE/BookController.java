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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @GetMapping("/")
    public String dashboard(Model model) {
        String apiUrl = "http://localhost:8081/api/books";
        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                apiUrl,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Map<String, Object>>>() {}
        );

        List<Map<String, Object>> books = response.getBody();
        int totalBooks = books != null ? books.size() : 0;
        model.addAttribute("totalBooks", totalBooks);

        return "dashboard";
    }

    @GetMapping("/addBook")
    public String addBooks() {
        return "addBook";
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
                          Model model) {
        System.out.println("I am in add book method");

        // Validate quantity
        if (quantity <= 0) {
            model.addAttribute("apiMessage", "Quantity must be greater than 0.");
            return "addBook";
        }

        RestTemplate restTemplate = new RestTemplate();
        Map<String, Object> newBook = new HashMap<>();
        newBook.put("bookName", bookName);
        newBook.put("bookAuthor", bookAuthor);
        newBook.put("quantity", quantity);

        // Post to backend API
        ResponseEntity<Map> responseEntity = restTemplate.postForEntity(
                "http://localhost:8081/api/books/add",
                newBook,
                Map.class
        );
        System.out.println("I am after response entity");

        Map response = responseEntity.getBody();
        System.out.println("I am after response body");

        String apiMessage;
        if (response != null && response.containsKey("message")) {
            apiMessage = response.get("message").toString();
            System.out.println("I am after response message");
        } else {
            apiMessage = "Book added successfully!";
            System.out.println("I am after response message");
        }
        System.out.println("Response from API: " + response);

        model.addAttribute("apiMessage", apiMessage);

        if (response != null && response.containsKey("success") && !(Boolean) response.get("success")) {
            return "addBook";
        }

        // Fetch books to display updated list
        String apiUrl = "http://localhost:8081/api/books";
        ResponseEntity<List<Map<String, Object>>> booksResponse = restTemplate.exchange(
                apiUrl,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Map<String, Object>>>() {}
        );
        List<Map<String, Object>> books = booksResponse.getBody();
        model.addAttribute("books", books);

        return "books";
    }

    @PostMapping("/borrow/{id}")
    public String borrowBook(@PathVariable Long id, Model model) {
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> responseEntity = restTemplate.postForEntity(
                "http://localhost:8081/api/books/" + id + "/borrow",
                null,
                Map.class
        );

        Map response = responseEntity.getBody();
        String apiMessage;
        if (response != null && response.containsKey("message")) {
            apiMessage = response.get("message").toString();
        } else {
            apiMessage = "Book borrowed successfully!";
        }
        model.addAttribute("apiMessage", apiMessage);

        // Fetch books again to display updated list
        String apiUrl = "http://localhost:8081/api/books";
        ResponseEntity<List<Map<String, Object>>> booksResponse = restTemplate.exchange(
                apiUrl,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Map<String, Object>>>() {}
        );
        List<Map<String, Object>> books = booksResponse.getBody();
        model.addAttribute("books", books);

        return "books";
    }

    @PostMapping("/return/{id}")
    public String returnBook(@PathVariable Long id, Model model) {
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> responseEntity = restTemplate.postForEntity(
                "http://localhost:8081/api/books/" + id + "/return",
                null,
                Map.class
        );

        Map response = responseEntity.getBody();
        String apiMessage;
        if (response != null && response.containsKey("message")) {
            apiMessage = response.get("message").toString();
        } else {
            apiMessage = "Book returned successfully!";
        }
        model.addAttribute("apiMessage", apiMessage);

        // Fetch books again to display updated list
        String apiUrl = "http://localhost:8081/api/books";
        ResponseEntity<List<Map<String, Object>>> booksResponse = restTemplate.exchange(
                apiUrl,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Map<String, Object>>>() {}
        );
        List<Map<String, Object>> books = booksResponse.getBody();
        model.addAttribute("books", books);

        return "books";
    }
}
