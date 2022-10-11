package br.ifba.edu.agenda.gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JTabbedPane;

public class Agenda extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Agenda frame = new Agenda();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Agenda() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		GridBagLayout gbl_contetPane = new GridBagLayout();
		gbl_contetPane.columnWidths = new int[] {451, 0};
		gbl_contetPane.rowHeights = new int[] {415, 0};
		gbl_contetPane.columnWeights = new double[] {0, 0, Double.MIN_VALUE};
		gbl_contetPane.rowWeights = new double[] {0, 0, Double.MIN_VALUE};
		contentPane.setLayout(gbl_contetPane);
		
		JTabbedPane tabledPane = new JTabbedPane(JTabbedPane.TOP);
		tabledPane.setTabLayoutPolicy(JTabbedPane.SCROLL_TAB_LAYOUT);
		GridBagConstraints gbc_tabblePane = new GridBagConstraints();
		gbc_tabblePane.fill = GridBagConstraints.BOTH;
		gbc_tabblePane.gridx = 0;
		gbc_tabblePane.gridy = 0;
		contentPane.add(tabledPane, gbc_tabblePane);
		
		JanelaCategoria j = new JanelaCategoria();
		tabledPane.add("Categoria",j);
		
	}

}
