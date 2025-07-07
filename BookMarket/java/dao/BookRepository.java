package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Book;


public class BookRepository{
	
	
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	
	private static BookRepository instance ;

	public static BookRepository getInstance() throws ClassNotFoundException, SQLException{
		if (instance == null)
			instance = new BookRepository();
		return instance;
	} 
	
	
	public BookRepository() throws ClassNotFoundException, SQLException {
	
		Connection conn = null;		
		
		String url = "jdbc:mysql://192.168.111.101:3306/bookmarketdb";
		String user = "bookmarketdb";
		String password = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1단계 성공");
		conn = DriverManager.getConnection(url, user, password);		
		System.out.println("2단계 성공");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from book";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		System.out.println("3단계 성공");
		while (rs.next()) {
			Book book = new Book();
			book.setBookId(rs.getString("b_id"));
			book.setName(rs.getString("b_name"));
			book.setUnitPrice(rs.getInt("b_unitPrice"));
			book.setAuthor(rs.getString("b_author"));
			book.setDescription(rs.getNString("b_description"));
			book.setPublisher(rs.getString("b_publisher"));
			book.setCategory(rs.getString("b_category"));
			book.setUnitsInStock(rs.getLong("b_unitsInStock"));
			book.setReleaseDate(rs.getString("b_releaseDate"));
			book.setCondition(rs.getString("b_condition"));
			book.setFilename(rs.getString("b_fileName"));
			
			listOfBooks.add(book);
			System.out.println(book.toString());
		}
		
		
	}
	public ArrayList<Book> getAllBooks() {
		return listOfBooks;
	}
	public Book getBookById(String bookId) {
		Book bookById = null;

		for (int i = 0; i < listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
				
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	
	public void addBook(Book book) {
		listOfBooks.add(book);
	}

}