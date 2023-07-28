package jmysql;

import java.net.URL;
import java.sql.*;
import java.util.Scanner;


public class Utils {
	
	static Scanner teclado = new Scanner(System.in);
	public static Connection conectar(){
		String CLASSE_DRIVER = "com.mysql.cj.jdbc.Driver";
		String USUARIO = "shz";
		String SENHA = "shouldz";
		String URL_SERVIDOR = "jdbc:mysql://localhost:3306/jmysql?useSSL=false";
		try{
			Class.forName(CLASSE_DRIVER);
			return DriverManager.getConnection(URL_SERVIDOR, USUARIO, SENHA);
		}catch (Exception e){
			if(e instanceof ClassNotFoundException){
				System.out.println("Verifique o drive de conexão");
			}else{
				System.out.println("Verifique se o servidor esta ativo");
				System.out.println(e);
			}
			System.exit(-42);
			return null;
		}
	}

	public static void desconectar(Connection conn){
		if(conn != null){
			try{
				conn.close();
			}catch (SQLException e){
				System.out.println("Não foi possivel fechar a conexão");
				e.printStackTrace();
			}
		}
	}
	
	public static void listar() {
		String BUSCAR_TODOS = "SELECT * FROM produtos";
		try{
			Connection conn = conectar();
			PreparedStatement produtos = conn.prepareStatement(BUSCAR_TODOS, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet res = produtos.executeQuery();

			res.last();
			int quantidade = res.getRow();
			res.beforeFirst();

			if(quantidade > 0){
				while (res.next()){
					System.out.println("ID: " + res.getInt(1));
					System.out.println("Produto: " + res.getString(2));
					System.out.println("Preço: " + res.getFloat(3));
					System.out.println("Estoque: " + res.getInt(4));
				}
			}else{
				System.out.println("Tabela vazia");
			}
			produtos.close();
			desconectar(conn);
		}catch (Exception e){
			e.printStackTrace();
			System.out.println("Erro de listagem");
			System.exit(-42);
		}
	}
	
	public static void inserir() {
		System.out.println("Nome do produto: ");
		String nome = teclado.nextLine();
		System.out.println("Preço do produto: ");
		Float preco = teclado.nextFloat();
		System.out.println("Quantidade em estoque: ");
		int estoque = teclado.nextInt();

		String INSERIR = "INSERT INTO produtos (nome, preco, estoque) VALUES (?, ?, ?)";

		//Tratamento para a falha de segurança do SQL Injection
		try{
			Connection conn = conectar();
			PreparedStatement salvar = conn.prepareStatement(INSERIR);

			salvar.setString(1, nome);
			salvar.setFloat(2, preco);
			salvar.setInt(3, estoque);

			salvar.executeUpdate();
			salvar.close();
			desconectar(conn);
			System.out.println("Inserção com sucesso");
		}catch (Exception e){
			e.printStackTrace();
			System.err.println("Erro ao salvar o produto");
			System.exit(-42);
		}
	}
	
	public static void atualizar() {
		System.out.println("Codigo do produto: ");
		int id = Integer.parseInt(teclado.nextLine());

		String BUSCAR_POR_ID = "SELECT * FROM produtos WHERE id=?";
		try {
			Connection conn = conectar();
			PreparedStatement produto = conn.prepareStatement(BUSCAR_POR_ID, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			produto.setInt(1, id);
			ResultSet res = produto.executeQuery();

			res.last();
			int quantidade = res.getRow();
			res.beforeFirst();

			if(quantidade > 0){
				System.out.println("Novo nome do produto: ");
				String nome = teclado.nextLine();

				System.out.println("Novo preco do produto: ");
				float preco = teclado.nextFloat();

				System.out.println("Nova quantidade em estoque: ");
				int estoque = teclado.nextInt();

				String ATUALIZAR = "UPDATE produtos SET nome=?, preco=?, estoque=? WHERE id=?";
				PreparedStatement upd = conn.prepareStatement(ATUALIZAR);

				upd.setString(1, nome);
				upd.setFloat(2, preco);
				upd.setInt(3, estoque);
				upd.setInt(4, id);

				upd.executeUpdate();
				upd.close();
				desconectar(conn);

			}else{
				System.out.println("Produto não encontrado");
			}

		}catch (Exception e){
			e.printStackTrace();
			System.err.println("Erro de update");
			System.out.println(e);
			System.exit(-42);
		}
	}
	
	public static void deletar() {
		String DELETAR = "DELETE FROM produtos WHERE id=?";
		String BUSCAR_POR_ID = "SELECT * FROM produtos WHERE id=?";

		System.out.println("Codigo do produto: ");
		int id = Integer.parseInt(teclado.nextLine());

		try {
			Connection conn = conectar();
			PreparedStatement produto = conn.prepareStatement(BUSCAR_POR_ID, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			produto.setInt(1, id);
			ResultSet res = produto.executeQuery();

			res.last();
			int quantidade = res.getRow();
			res.beforeFirst();

			if(quantidade > 0){
				PreparedStatement del = conn.prepareStatement(DELETAR);
				del.setInt(1, id);
				del.executeUpdate();
				del.close();
				desconectar(conn);
				System.out.println("deletado com sucesso");
			}else{
				System.out.println("Produto não encontrado");
			}

		}catch (Exception e){
			e.printStackTrace();
			System.err.println("Erro de Delete");
			System.exit(-42);
		}
	}
	
	public static void menu() {
		System.out.println("==================Gerenciamento de Produtos===============");
		System.out.println("Selecione uma opção: ");
		System.out.println("1 - Listar produtos.");
		System.out.println("2 - Inserir produtos.");
		System.out.println("3 - Atualizar produtos.");
		System.out.println("4 - Deletar produtos.");
		
		int opcao = Integer.parseInt(teclado.nextLine());
		if(opcao == 1) {
			listar();
		}else if(opcao == 2) {
			inserir();
		}else if(opcao == 3) {
			atualizar();
		}else if(opcao == 4) {
			deletar();
		}else {
			System.out.println("Opção inválida.");
		}
	}
}
