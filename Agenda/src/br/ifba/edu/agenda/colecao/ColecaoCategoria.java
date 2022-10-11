package br.ifba.edu.agenda.colecao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ifba.edu.agenda.basicas.Categoria;

public class ColecaoCategoria {

	public void adicionarCategoria(Categoria c) {
		try {
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("insert into Categoria (nome) values (?)");
			stmt.setString(1, c.getNome());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void atualizarCategoria(Categoria c) {
		try {
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("UPDATE categoria SET nome = ? where ID = ?");
			stmt.setString(1, c.getNome());
			stmt.setInt(2, c.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deletarCategoria(Categoria c) {	
		try {
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("DELETE FROM categoria where ID = ?");
			stmt.setInt(1, c.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
	
	public List<Categoria> listarCategoria() {
		List<Categoria> resposta = new ArrayList<Categoria>();
		
		try {
			
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("select * from Categoria");
			ResultSet rs = stmt.executeQuery(); 
		
			while(rs.next()) {
				
				Categoria c = new Categoria();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				resposta.add(c);
			}
			
		}catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
		return resposta;
		

	}
	
	public Categoria procurarCategoria(int id) {
		
		try {
			
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("Select * FROM Categoria where id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				Categoria c = new Categoria();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				return c;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
		return null;
	}
	
	public Categoria procurarCategoriaNome(String nome) {
		
		try {
			
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("Select * FROM Categoria where nome= ?");
			stmt.setString(1, nome);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				Categoria c = new Categoria();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				return c;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
		return null;
	}
}

