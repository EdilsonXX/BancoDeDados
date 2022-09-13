package br.ifba.edu.agenda.cadastro;

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
	
}
