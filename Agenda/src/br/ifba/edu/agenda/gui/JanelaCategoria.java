package br.ifba.edu.agenda.gui;

import javax.swing.JPanel;
import javax.swing.border.BevelBorder;

import br.ifba.edu.agenda.basicas.Categoria;
import br.ifba.edu.agenda.cadastro.CadastroCategoria;
import br.ifba.edu.agenda.colecao.ColecaoCategoria;
import br.ifba.edu.agenda.exception.CadastroCategoriaException;

import java.awt.Color;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JScrollPane;

public class JanelaCategoria extends JPanel {
	private JTextField txtCategoria;

	/**
	 * Create the panel.
	 */
	public JanelaCategoria() {
		setBackground(new Color(51, 255, 153));
		
		setLayout(null);
		setBounds(10, 11, 451, 396);
		
		JPanel panel = new JPanel();
		panel.setBorder(new BevelBorder(BevelBorder.RAISED, new Color(102, 0, 204), new Color(153, 0, 204), new Color(204, 153, 204), new Color(204, 51, 255)));
		panel.setBounds(10, 11, 431, 86);
		add(panel);
		panel.setLayout(null);
		
		JButton btnNewButton_1 = new JButton("Atualizar");
		btnNewButton_1.setIcon(new ImageIcon(getClass().getResource(("../../../../../../Resources/icons8-sincronizar-30.png"))));
		btnNewButton_1.setBounds(10, 7, 89, 68);
		panel.add(btnNewButton_1);
		
		JButton btnNewButton = new JButton("Adicionar");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				CadastroCategoria c = new CadastroCategoria();
				Categoria cat = new Categoria();
				cat.setNome(txtCategoria.getText());
				
				try {
					c.adicionarCategoria(cat);
				}catch(CadastroCategoriaException e2) {
					return;
				}
			}
		});
		btnNewButton.setIcon(new ImageIcon(getClass().getResource(("../../../../../../Resources/icons8-adicionar-grupo-de-usu\u00E1rios-homem-homem-30.png"))));
		btnNewButton.setBounds(112, 7, 89, 68);
		panel.add(btnNewButton);
		
		JButton btnNewButton_2 = new JButton("Remover");
		btnNewButton_2.setIcon(new ImageIcon(getClass().getResource(("../../../../../../Resources/icons8-excluir-30.png"))));
		btnNewButton_2.setBounds(211, 7, 89, 68);
		panel.add(btnNewButton_2);
		
		JButton btnNewButton_3 = new JButton("Editar");
		btnNewButton_3.setIcon(new ImageIcon(getClass().getResource(("../../../../../../Resources/icons8-editar-30.png"))));
		btnNewButton_3.setBounds(310, 7, 89, 68);
		panel.add(btnNewButton_3);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBorder(new BevelBorder(BevelBorder.RAISED, new Color(153, 0, 204), new Color(102, 0, 204), new Color(204, 51, 204), new Color(255, 51, 204)));
		panel_1.setForeground(new Color(153, 0, 51));
		panel_1.setBackground(new Color(255, 255, 255));
		panel_1.setBounds(10, 182, 431, 181);
		add(panel_1);
		
		JScrollPane scrollPane = new JScrollPane();
		panel_1.add(scrollPane);
		
		JLabel lblCategoria = new JLabel("Categoria");
		lblCategoria.setBounds(20, 104, 76, 14);
		add(lblCategoria);
		
		txtCategoria = new JTextField();
		txtCategoria.setBounds(10, 126, 278, 20);
		add(txtCategoria);
		txtCategoria.setColumns(10);
		
	}
}
