package br.ifba.edu.agenda.colecao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ifba.edu.agenda.basicas.Categoria;
import br.ifba.edu.agenda.colecao.ColecaoCategoria;
import br.ifba.edu.agenda.basicas.Contato;

public class ColecaoContato {

	public void adicionarContato(Contato c) {
		try {
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("insert into Contato (nome, email, fone, celular, id_categoria) values (?,?,?,?,?)");
			stmt.setString(1, c.getNome());
			stmt.setString(2, c.getEmail());
			stmt.setString(3, c.getFone());
			stmt.setString(4, c.getCelular());
			stmt.setInt(5, c.getCategoria().getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Contato> listarContato() {
		List<Contato> contatos = new ArrayList<Contato>();
		ColecaoCategoria cc = new ColecaoCategoria();
		
		try {
			
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("select * from Contato");
			ResultSet rs = stmt.executeQuery(); 
		
			while(rs.next()) {
				
				Contato c = new Contato();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setFone(rs.getString("fone"));
				c.setCelular(rs.getString("celular"));
				c.setCategoria(cc.procurarCategoria(rs.getInt("id_categoria")));
				contatos.add(c);
			}
			
		}catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
		return contatos;
		

	}
	
	public List<Contato> listarContatoPorCategoria(Categoria cat) {
		List<Contato> contatos = new ArrayList<Contato>();
		ColecaoCategoria cc = new ColecaoCategoria();
		
		try {
			
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("select * from Contato where id_categoria = ?");
			stmt.setInt(1, cat.getId());
			ResultSet rs = stmt.executeQuery(); 
		
			while(rs.next()) {
				
				Contato c = new Contato();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setFone(rs.getString("fone"));
				c.setCelular(rs.getString("celular"));
				c.setCategoria(cc.procurarCategoria(rs.getInt("id_categoria")));
				contatos.add(c);
			}
			
		}catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
		return contatos;
		

	}
	
	public void atualizarContato(Contato c) {
		try {
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("UPDATE Contato SET nome = ?, email = ?, fone = ?, celular = ?, id_categpria = ? where ID = ?");
			stmt.setString(1, c.getNome());
			stmt.setString(2, c.getEmail());
			stmt.setString(3, c.getFone());
			stmt.setString(4, c.getCelular());
			stmt.setInt(5, c.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Contato procurarId(int id) {
		ColecaoCategoria cc = new ColecaoCategoria();
		try {
			PreparedStatement stmt =
			Conexao.getConnection().prepareStatement("Select * from Contato where id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			if(rs.next()) {
				Contato c = new Contato();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setFone(rs.getString("fone"));
				c.setCelular(rs.getString("celular"));
				c.setCategoria(cc.procurarCategoria(rs.getInt("id_categoria")));
				return c;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Contato procurarNome(String nome) {
		ColecaoCategoria cc = new ColecaoCategoria();
		try {
			PreparedStatement stmt =
			Conexao.getConnection().prepareStatement("Select * from Contato where nome = ?");
			stmt.setString(1, nome);
			ResultSet rs = stmt.executeQuery();

			if(rs.next()) {
				Contato c = new Contato();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setFone(rs.getString("fone"));
				c.setCelular(rs.getString("celular"));
				c.setCategoria(cc.procurarCategoria(rs.getInt("id_categoria")));
				return c;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
