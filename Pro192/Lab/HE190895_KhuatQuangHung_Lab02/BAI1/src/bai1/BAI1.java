
package bai1;

public class BAI1 {

    public static void main(String[] args) {

        Book book = new Book("J.K. Rowling", "Harry Potter", 500, true);

        // Testing getters
        System.out.println("Author: " + book.getAuthor());
        System.out.println("Title: " + book.getTitle());
        System.out.println("Number of Pages: " + book.getNoOfPages());
        System.out.println("Is Fiction: " + book.isFiction());

        System.out.println();
        
        // change in4 
        book.setAuthor("O Alquimista");
        book.setTitle("Nhà Giả Kim");
        book.setNoOfPages(225);
        book.setFiction(false);

        
        System.out.println("Author: " + book.getAuthor());
        System.out.println("Title: " + book.getTitle());
        System.out.println("Number of Pages: " + book.getNoOfPages());
        System.out.println("Is Fiction: " + book.isFiction());

    }
    
}
