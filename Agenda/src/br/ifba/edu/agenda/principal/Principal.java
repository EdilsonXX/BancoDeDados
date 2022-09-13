package br.ifba.edu.agenda.principal;

import br.ifba.edu.agenda.basicas.Categoria;
import br.ifba.edu.agenda.colecao.ColecaoCategoria;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Categoria c = new Categoria(2);
		ColecaoCategoria cg = new ColecaoCategoria();
		
		//cg.deletarCategoria(c);
		
		cg.listarCategoria().forEach(System.out :: println);
		
		for (Categoria ca:cg.listarCategoria()) {
			
			System.out.println(ca);
			
		}
		
	}

}
