package br.ifba.edu.agenda.principal;

import br.ifba.edu.agenda.basicas.Contato;
import br.ifba.edu.agenda.colecao.ColecaoCategoria;
import br.ifba.edu.agenda.colecao.ColecaoContato;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//Categoria c = new Categoria(2);
		ColecaoCategoria cg = new ColecaoCategoria();
		ColecaoContato cc = new ColecaoContato();
		
		//cg.deletarCategoria(c);
		
		cg.listarCategoria().forEach(System.out :: println);
		
		Contato c = new Contato();
		
		c.setNome("Geovana Gostosa");
		c.setEmail("geovana.gostosa@gmail");
		c.setFone("987456123");
		c.setCelular("8888888899");
		c.setCategoria(cg.procurarCategoria(1));
		
		cc.adicionarContato(c);
		
		cc.listarContato().forEach(System.out::println);
	}

}
