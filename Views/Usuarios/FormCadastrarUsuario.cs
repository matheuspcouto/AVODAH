﻿using EscalasMetodista.Conexão;
using EscalasMetodista.Model;
using EscalasMetodista.Session;
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
using FontAwesome.Sharp;
using System.Net;
using System.Net.Mail;
using EscalasMetodista.Views.Outros;

namespace EscalasMetodista.Views.Usuarios
{
    public partial class FormCadastrarUsuario : Form
    {
        Pessoa pessoa = new Pessoa();
        SqlCommand cmd = new SqlCommand();
        private bool temFuncaoSecundaria = false;
        private bool update = false;
        public int idPessoaExcluida;
        private int idPessoaPesquisa { get; set; }
        public FormCadastrarUsuario()
        {
            InitializeComponent();
        }

        public FormCadastrarUsuario(int id)
        {
            InitializeComponent();
            idPessoaPesquisa = id;
            update = true;
        }

        private string gerarSenha()
        {
            string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ023456789";
            string senha = "";
            Random random = new Random();
            for (int f = 0; f < 6; f++)
            {
                senha = senha + chars.Substring(random.Next(0, chars.Length - 1), 1);
            }

            return senha;
        }

        private void preencheComboBoxTipoUsuario()
        {
            cmd.CommandText = "SELECT * FROM tipoUsuario";
            Conexao conexao = new Conexao();
            try
            {
                cmd.Connection = conexao.Conectar();
                DataTable dt = new DataTable();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);

                cbTipoUsuario.DisplayMember = "descricao";
                cbTipoUsuario.ValueMember = "idTipoUsuario";
                cbTipoUsuario.DataSource = dt;

            }
            catch (Exception erro)
            {
                Validacoes.exibeMensagem("Erro: " + erro, Mensagem.tipo.Erro, false);
            }
            finally
            {
                conexao.Desconectar();
            }
        }

        private void preencheComboBoxFuncaoPrincipal()
        {
            cmd.CommandText = "SELECT * FROM funcao";
            Conexao conexao = new Conexao();
            try
            {
                cmd.Connection = conexao.Conectar();
                DataTable dt = new DataTable();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);

                cbFuncaoPrincipal.DisplayMember = "descricaoFuncao";
                cbFuncaoPrincipal.ValueMember = "idFuncao";
                cbFuncaoPrincipal.DataSource = dt;

            }
            catch (Exception erro)
            {
                Validacoes.exibeMensagem("Erro: " + erro, Mensagem.tipo.Erro, false);
            }
            finally
            {
                conexao.Desconectar();
            }
        }

        private void preencheComboBoxFuncaoSecundaria()
        {
            cmd.CommandText = "SELECT * FROM funcao";
            Conexao conexao = new Conexao();
            try
            {
                cmd.Connection = conexao.Conectar();
                DataTable dt = new DataTable();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);

                cbFuncaoSecundaria.DisplayMember = "descricaoFuncao";
                cbFuncaoSecundaria.ValueMember = "idFuncao";
                cbFuncaoSecundaria.DataSource = dt;

            }
            catch (Exception erro)
            {
                Validacoes.exibeMensagem("Erro: " + erro, Mensagem.tipo.Erro, false);
            }
            finally
            {
                conexao.Desconectar();
            }
        }
        private void preencheComboBoxSubFuncaoPrincipal()
        {
            cmd.CommandText = "SELECT * FROM subfuncao WHERE idFuncao_fk = " + (int)cbFuncaoPrincipal.SelectedValue;
            Conexao conexao = new Conexao();
            try
            {
                cmd.Connection = conexao.Conectar();
                DataTable dt = new DataTable();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);

                cbSubFuncaoPrincipal.DisplayMember = "descricao";
                cbSubFuncaoPrincipal.ValueMember = "idSubfuncao";
                cbSubFuncaoPrincipal.DataSource = dt;

                dr.Close();

            }
            catch (Exception erro)
            {
                Validacoes.exibeMensagem("Erro: " + erro, Mensagem.tipo.Erro, false);
            }
            finally
            {
                conexao.Desconectar();
            }
        }

        private void preencheComboboxSubFuncaoSecundaria()
        {
            cmd.CommandText = "SELECT * FROM subfuncao WHERE idFuncao_fk = " + (int)cbFuncaoSecundaria.SelectedValue;
            Conexao conexao = new Conexao();
            try
            {
                cmd.Connection = conexao.Conectar();
                DataTable dt = new DataTable();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);

                cbSubFuncaoSecundaria.DisplayMember = "descricao";
                cbSubFuncaoSecundaria.ValueMember = "idSubfuncao";
                cbSubFuncaoSecundaria.DataSource = dt;

            }
            catch (Exception erro)
            {
                Validacoes.exibeMensagem("Erro: " + erro, Mensagem.tipo.Erro, false);
            }
            finally
            {
                conexao.Desconectar();
            }
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void FormCadastrarUsuario_Load(object sender, EventArgs e)
        {
            ActiveControl = btnSalvar;
            this.preencheComboBoxFuncaoPrincipal();
            this.preencheComboBoxFuncaoSecundaria();
            this.preencheComboBoxTipoUsuario();

            if (update)
            {
                setPessoa(idPessoaPesquisa);
                return;
            }
            cbTipoUsuario.Text = "Selecione...";
            cbFuncaoPrincipal.Text = "Selecione...";
            cbFuncaoSecundaria.Text = "Selecione...";
            cbSubFuncaoPrincipal.Text = "Selecione...";
            cbSubFuncaoSecundaria.Text = "Selecione...";
        }

        private void cbFuncaoPrincipal_SelectedValueChanged(object sender, EventArgs e)
        {
            if (cbFuncaoPrincipal.SelectedValue != null)
                preencheComboBoxSubFuncaoPrincipal();
        }

        private void cbFuncaoSecundaria_SelectedValueChanged(object sender, EventArgs e)
        {
            if (cbFuncaoSecundaria.SelectedValue != null)
                preencheComboboxSubFuncaoSecundaria();
        }

        private void btnLimparFuncaoPrincipal_Click(object sender, EventArgs e)
        {
            cbFuncaoPrincipal.Text = "Selecione...";
            cbSubFuncaoPrincipal.Text = "Selecione...";
        }

        private void btnLimparFuncaoSecundaria_Click(object sender, EventArgs e)
        {
            cbFuncaoSecundaria.Text = "Selecione...";
            cbSubFuncaoSecundaria.Text = "Selecione...";
        }

        private void cbFuncaoPrincipal_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void cbSubFuncaoPrincipal_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void cbFuncaoSecundaria_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void cbSubFuncaoSecundaria_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void cbTipoUsuario_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void btnDeletar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Deseja realmente excluir este usuário?", "Confirmação", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                pessoa.delete(pessoa.idPessoa);

                idPessoaExcluida = pessoa.idPessoa;
                btnLimparForm_Click(null, null);

                Validacoes.exibeMensagem("Deseja desfazer as alterações ? Se sim, clique no link abaixo.", Mensagem.tipo.Info, true);

            }
        }

        private void btnLimparForm_Click(object sender, EventArgs e)
        {
            txtNome.Text = null;
            txtSobrenome.Text = null;
            txtEmail.Text = null;
            txtEmail.Enabled = true;
            txtSobrenome.Enabled = true;
            cbTipoUsuario.Text = "Selecione...";
            cbFuncaoPrincipal.Text = "Selecione...";
            cbFuncaoSecundaria.Text = "Selecione...";
            cbSubFuncaoPrincipal.Text = "Selecione...";
            cbSubFuncaoSecundaria.Text = "Selecione...";
            update = false;
            btnSalvar.IconChar = IconChar.Plus;
            pessoa = new Pessoa();
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            SubFuncao sub = new SubFuncao();
            TipoUsuario tipo = new TipoUsuario();

            try
            {
                if (cbTipoUsuario.Text == "Selecione...")
                {
                    Validacoes.exibeMensagem("É necessário informar o Tipo de Usuário", Mensagem.tipo.Erro, false);
                    return;
                }

                if (cbSubFuncaoPrincipal.Text == "Selecione...")
                {
                    Validacoes.exibeMensagem("É necessário informar a Função Principal", Mensagem.tipo.Erro, false);
                    return;
                }

                if (cbTipoUsuario.SelectedValue != null && (int)cbTipoUsuario.SelectedValue == 3)
                {
                    if ((int)cbFuncaoSecundaria.SelectedValue != 3 || (int)cbFuncaoPrincipal.SelectedValue != 3)
                    {
                        Validacoes.exibeMensagem("O Tipo de Usuário 'Célula' só pode ter funções relacionadas a células", Mensagem.tipo.Erro, false);
                        return;
                    }
                }

                if (cbSubFuncaoPrincipal.Text == cbSubFuncaoSecundaria.Text)
                {
                    Validacoes.exibeMensagem("As funções não podem ser iguais", Mensagem.tipo.Erro, false);
                    return;
                }
                
                else
                {
                    if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrWhiteSpace(txtEmail.Text))
                    {
                        Validacoes.exibeMensagem("Informe um E-mail", Mensagem.tipo.Erro, false);
                        return;
                    }
                    if (string.IsNullOrEmpty(txtSobrenome.Text) || string.IsNullOrWhiteSpace(txtSobrenome.Text))
                    {
                        Validacoes.exibeMensagem("Informe o Sobrenome", Mensagem.tipo.Erro, false);
                        return;
                    }
                }

                pessoa.tipoUsuario = tipo.find((int)cbTipoUsuario.SelectedValue);
                pessoa.Nome = txtNome.Text;
                pessoa.Sobrenome = pessoa.tipoUsuario.idTipoUsuario == 3 ? null : txtSobrenome.Text;
                pessoa.Email = pessoa.tipoUsuario.idTipoUsuario == 3 ? null : txtEmail.Text;

                if (!update)
                {
                    pessoa.Senha = pessoa.tipoUsuario.idTipoUsuario == 3 ? null : gerarSenha();
                    pessoa.dataCadastro = DateTime.Today;
                    pessoa.Status = "Ativo";
                }

                pessoa.funcaoPrincipal = sub.find((int)cbSubFuncaoPrincipal.SelectedValue);

                if (cbSubFuncaoSecundaria.Text != "Selecione...")
                {
                    pessoa.funcaoSecundaria = sub.find((int)cbSubFuncaoSecundaria.SelectedValue);
                    temFuncaoSecundaria = true;
                }
                else
                    temFuncaoSecundaria = false;


                if (!string.IsNullOrEmpty(txtEmail.Text) || !string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    if (Validacoes.verificaUnico("email", "pessoa", txtEmail.Text, pessoa.idPessoa, "idPessoa") == true)
                    {
                        Validacoes.exibeMensagem("Este E-mail já está em uso", Mensagem.tipo.Erro, false);
                        return;
                    }
                }


                if (Validacoes.ValidarObjeto(pessoa) == true)
                {
                    if (update)
                    {
                        pessoa.update(pessoa, pessoa.idPessoa, temFuncaoSecundaria);
                        setPessoa(pessoa.idPessoa);
                    }
                    else
                    {
                        pessoa.create(pessoa, temFuncaoSecundaria);
                        setPessoa(pessoa.getId());

                        if (pessoa.tipoUsuario.idTipoUsuario != 3)
                            sendEmailComSenhaUsuario(pessoa.Nome, pessoa.Email, pessoa.Senha);
                    }
                }
            }
            catch (Exception ex)
            {
                Validacoes.exibeMensagem("Erro: " + ex, Mensagem.tipo.Erro, false);
            }
        }

        private void setPessoa(int id)
        {
            pessoa = pessoa.find(id);

            if (pessoa != null)
            {
                txtNome.Text = pessoa.Nome;
                txtSobrenome.Text = pessoa.Sobrenome;
                txtEmail.Text = pessoa.Email;
                cbFuncaoPrincipal.SelectedValue = pessoa.funcaoPrincipal.funcao.idFuncao;
                cbSubFuncaoPrincipal.SelectedValue = pessoa.funcaoPrincipal.idSubFuncao;

                if (pessoa.funcaoSecundaria != null)
                {
                    cbFuncaoSecundaria.SelectedValue = pessoa.funcaoSecundaria.funcao.idFuncao;
                    cbSubFuncaoSecundaria.SelectedValue = pessoa.funcaoSecundaria.idSubFuncao;
                }
                else
                {
                    cbFuncaoSecundaria.Text = "Selecione...";
                    cbSubFuncaoSecundaria.Text = "Selecione...";
                }

                cbTipoUsuario.SelectedValue = pessoa.tipoUsuario.idTipoUsuario;
                btnDeletar.Enabled = true;
                btnSalvar.IconChar = IconChar.Pen;
                update = true;
            }
        }

        private void btnConsultarUsuario_Click(object sender, EventArgs e)
        {
            FormPesquisaUsuario form = new FormPesquisaUsuario();
            form.ShowDialog();
        }

        private void btnLimparForm_MouseHover(object sender, EventArgs e)
        {
            btnLimparForm.BackColor = Color.LightGray;
            btnLimparForm.ForeColor = Color.Black;
            btnLimparForm.IconColor = Color.Black;
            btnLimparForm.FlatAppearance.BorderColor = Color.Black;
        }

        private void btnLimparForm_MouseLeave(object sender, EventArgs e)
        {
            btnLimparForm.BackColor = Color.Transparent;
            btnLimparForm.ForeColor = Color.LightGray;
            btnLimparForm.IconColor = Color.LightGray;
            btnLimparForm.FlatAppearance.BorderColor = Color.LightGray;
        }

        private void cbTipoUsuario_SelectedValueChanged(object sender, EventArgs e)
        {

            if (cbTipoUsuario.SelectedValue != null && (int)cbTipoUsuario.SelectedValue == 3)
            {
                txtEmail.Enabled = false;
                txtEmail.Text = null;
                txtSobrenome.Enabled = false;
                txtSobrenome.Text = null;
                label10.Visible = false;
                label11.Visible = false;
                return;
            }
            txtEmail.Enabled = true;
            txtSobrenome.Enabled = true;
            label10.Visible = true;
            label11.Visible = true;
        }

        private void sendEmailComSenhaUsuario(String nome, String email, String senha)
        {
            try
            {
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("matheuspcouto70@gmail.com");
                    mail.To.Add(email);
                    mail.Subject = "Senha de Cadastro do Sistema de Escalas Metodista";
                    mail.Body = "Olá " + nome + "! vimos que foi realizado seu cadastro no Sistema de Escalas Metodista, sua senha de acesso é: <strong>" + senha + "</strong>";
                    mail.IsBodyHtml = true;

                    using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtpClient.EnableSsl = true;
                        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                        smtpClient.UseDefaultCredentials = false;
                        smtpClient.Credentials = new NetworkCredential("matheuspcouto70@gmail.com", "Mat230500");
                        smtpClient.Send(mail);
                        Validacoes.exibeMensagem("E-mail com senha de acesso enviado para " + email, Mensagem.tipo.Sucesso, false);
                    }
                }
            }
            catch (Exception ex)
            {
                Validacoes.exibeMensagem("Erro: " + ex, Mensagem.tipo.Erro, false);
            }
        }

        private void txtEmail_MouseLeave(object sender, EventArgs e)
        {
            if (pessoa.tipoUsuario.idTipoUsuario != 3)
            {
                if (!string.IsNullOrEmpty(txtEmail.Text) || !string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    if (Validacoes.verificaUnico("email", "pessoa", txtEmail.Text, pessoa.idPessoa, "idPessoa") == true)
                    {
                        Validacoes.exibeMensagem("Este E-mail já está em uso", Mensagem.tipo.Warning, false);
                        return;
                    }
                }
            }
        }

        private void cbSubFuncaoPrincipal_SelectionChangeCommitted(object sender, EventArgs e)
        {
            if (cbSubFuncaoSecundaria.SelectedValue != null)
            {
                if (cbSubFuncaoPrincipal.Text == cbSubFuncaoSecundaria.Text)
                {
                    Validacoes.exibeMensagem("As funções não podem ser iguais", Mensagem.tipo.Warning, false);
                    return;
                }
            }
        }

        private void cbSubFuncaoSecundaria_SelectionChangeCommitted(object sender, EventArgs e)
        {
            if (cbSubFuncaoSecundaria.SelectedValue != null)
            {
                if (cbSubFuncaoPrincipal.Text == cbSubFuncaoSecundaria.Text)
                {
                    Validacoes.exibeMensagem("As funções não podem ser iguais", Mensagem.tipo.Warning, false);
                    return;
                }
            }
        }
    }
}
