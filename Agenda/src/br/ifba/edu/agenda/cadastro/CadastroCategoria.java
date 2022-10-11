package br.ifba.edu.agenda.cadastro;

import java.util.List;

import br.ifba.edu.agenda.basicas.Categoria;
import br.ifba.edu.agenda.colecao.ColecaoCategoria;
import br.ifba.edu.agenda.exception.CadastroCategoriaException;

public class CadastroCategoria {

	ColecaoCategoria col = new ColecaoCategoria();
	
	public void adicionarCategoria(Categoria c) throws CadastroCategoriaException{
		
		if (col.procurarCategoriaNome(c.getNome())!=null) {
			
			CadastroCategoriaException ex = new CadastroCategoriaException(c.getNome());
			throw(ex);
			
		}
		
		this.col.adicionarCategoria(c);
		
	}
	
	public void atualizarCategoria(Categoria c) {
		
		col.atualizarCategoria(c);
		
	}
	
	public List<Categoria> listarCategoria() {
		
		return col.listarCategoria();
		
	}
	
	public Categoria procurarCategoria(int id) {
		
		return col.procurarCategoria(id);
		
	}
	
	public Categoria procurarCategoriaNome(String nome) {
		
		return col.procurarCategoriaNome(nome);
		
	}
	
	public void deletarCategoria(Categoria c) {
		
		col.deletarCategoria(c);
		
	}
	
}
