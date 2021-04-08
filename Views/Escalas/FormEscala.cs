﻿using EscalasMetodista.Conexão;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EscalasMetodista.Views.Escalas
{
    public partial class FormEscala : Form
    {
        public int tipoEscala;
        SqlCommand cmd = new SqlCommand();
        private Label subfuncoes, datas, pessoas, label;
        public DateTime dataInicio, dataFim;
        public TimeSpan dias;
        public String intervaloEscala;

        public FormEscala()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Deseja realmente sair? Você pode perder todo o trabalho feito.", "Confirmação", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Hide();
            }
        }

        private void FormEscalaLouvor_Load(object sender, EventArgs e)
        {
            lbNomeEscala.Left = (this.Width - lbNomeEscala.Width) / 2;
            txtNomeEscala.Left = (this.Width - txtNomeEscala.Width) / 2;
            carregarTbDatasEscala();
            carregarCabecalhoEscala();
        }

        private void carregarCabecalhoEscala()
        {
            cmd.CommandText = "SELECT descricao FROM SubFuncao WHERE idFuncao_fk = " + tipoEscala;
            Conexao conexao = new Conexao();
            try
            {
                cmd.Connection = conexao.Conectar();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    tbCabecalhoEscala.GrowStyle = TableLayoutPanelGrowStyle.AddColumns;
                    subfuncoes = new Label();
                    subfuncoes.Text = dr[0].ToString();
                    subfuncoes.ForeColor = Color.Black;
                    subfuncoes.TextAlign = ContentAlignment.MiddleCenter;
                    subfuncoes.Dock = DockStyle.Fill;
                    tbCabecalhoEscala.Controls.Add(subfuncoes);
                }

                //tbCabecalhoEscala.GrowStyle = TableLayoutPanelGrowStyle.AddRows;
                //pessoas = new Label();
                //pessoas.Text = "teste";
                //subfuncoes.ForeColor = Color.Black;
                //pessoas.TextAlign = ContentAlignment.MiddleCenter;
                //pessoas.Dock = DockStyle.Fill;
                //tbCabecalhoEscala.SuspendLayout();
                //tbCabecalhoEscala.RowStyles.Add(new RowStyle(SizeType.Absolute, 50));
                //tbCabecalhoEscala.Controls.Add(pessoas);
                //tbCabecalhoEscala.RowCount += 1;
                //tbCabecalhoEscala.ResumeLayout();
            }
            catch (Exception erro)
            {
                MessageBox.Show("Erro: " + erro.Message);
            }
            finally
            {
                conexao.Desconectar();
            }
        }

        private void carregarTbDatasEscala()
        {

            int i = 0;

            while (dataInicio != dataFim && i < dias.Days)
            {
                tbCabecalhoEscala.GrowStyle = TableLayoutPanelGrowStyle.AddRows;
                tbCabecalhoEscala.RowStyles.Add(new RowStyle(SizeType.Absolute, 64));
                datas = new Label();
                datas.Text = dataInicio.ToString("dd/MM");
                dataInicio = dataInicio.AddDays(1);
                datas.TextAlign = ContentAlignment.MiddleCenter;
                datas.ForeColor = Color.Black;
                datas.Dock = DockStyle.Fill;
                tbCabecalhoEscala.Controls.Add(datas, 0, tbCabecalhoEscala.RowCount);
                tbCabecalhoEscala.RowCount++;
            }
        }

        private void Addlabel(String text)
        {
            int qtdLinhas = 0;
            label = new Label();
            label.Dock = DockStyle.Fill;
            label.Text = text;
            label.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            tbCabecalhoEscala.Controls.Add(label, 1, qtdLinhas);
            qtdLinhas++;
        }

        private void FormEscalaLouvor_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.Enter:
                    this.editarNomeEscala();
                    break;
                default:
                    break;
            }
        }

        private void tbCabecalhoEscala_CellPaint(object sender, TableLayoutCellPaintEventArgs e)
        {
            Graphics g = e.Graphics;

            //g.DrawRectangle(
            //    Pens.Gray,
            //    e.CellBounds.Location.X + 2,
            //    e.CellBounds.Location.Y + 1,
            //    e.CellBounds.Width - 2, e.CellBounds.Height - 2);


            if (e.Column == 0)
            {
                e.Graphics.FillRectangle(Brushes.DarkGray, e.CellBounds);
            }

            if (e.Row == 0)
            {
                if (e.Column != 0)
                {
                    e.Graphics.FillRectangle(Brushes.Maroon, e.CellBounds);
                    //carregarCabecalhoEscala();
                }
            }

            //g.FillRectangle(
            //    Brushes.White,
            //    e.CellBounds.Location.X + 2,
            //    e.CellBounds.Location.Y + 1,
            //    e.CellBounds.Width - 2,
            //    e.CellBounds.Height - 2);
        }

        private void lbNomeEscala_DoubleClick(object sender, EventArgs e)
        {
            txtNomeEscala.Visible = true;
            lbNomeEscala.Visible = false;
        }

        private void editarNomeEscala()
        {
            if (string.IsNullOrWhiteSpace(txtNomeEscala.Text))
            {
                MessageBox.Show("O nome da escala não pode ficar em branco.", "Campo em Branco", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                lbNomeEscala.Text = txtNomeEscala.Text;
                txtNomeEscala.Visible = false;
                lbNomeEscala.Visible = true;
                lbNomeEscala.Left = (this.Width - lbNomeEscala.Width) / 2;
                txtNomeEscala.Left = (this.Width - txtNomeEscala.Width) / 2;
            }
        }
    }
}

