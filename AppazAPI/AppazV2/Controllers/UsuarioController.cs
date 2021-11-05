using AppazV2.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppazV2.Controllers
{
    [Route("[Controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private string Verificacoes(Usuario UsuarioVM)
        {
            //Verifica se está sendo inserido um registro nulo
            if (UsuarioVM == null)
            {
                return "Não é permitido a inserção de registros nulos.";
            }

            //Verifica se algum email ou cpf já está cadastrado
            foreach(Usuario item in BancoDados.RegistrosUsuario)
            {
                if (item.Email == UsuarioVM.Email || item.CPF == UsuarioVM.CPF)
                {
                    return "E-mail ou CPF já cadastrado.";
                }
            }

            //Verifica se todas as causas de interesse estão cadastradas
            foreach(Causa item in UsuarioVM.CausasInteresse)
            {
                if (!BancoDados.RegistrosCausa.Exists(itemCausa => itemCausa.Id == item.Id))
                {
                    return "A causa " + item.Nome + " não está cadastrada.";
                }
            }
            return "";
        }

        //Inserção de um registro no Banco
        [HttpPost("UsuarioPost")]
        public string UsuarioPost(Usuario UsuarioVM)
        {
            string mensagem = Verificacoes(UsuarioVM);
            if (mensagem != "")
            {
                return mensagem;
            }
            BancoDados.RegistrosUsuario.Add(UsuarioVM);
            return "Usuário registrado";
        }

        //Consulta de todos os registros no Banco
        [HttpGet("UsuarioGet")]
        public IEnumerable<Usuario> UsuarioGet()
        {
            return BancoDados.RegistrosUsuario;
        }

        //Consulta de um registro por Id no Banco
        [HttpGet("/UsuarioGetId/{Id}")]
        public Usuario UsuarioGetId(int Id)
        {
            return BancoDados.RegistrosUsuario.Find(itemUsuario => itemUsuario.Id == Id);
        }

        //Consulta dos registros no Banco por cidade
        [HttpGet("UsuarioGetCidade/{Cidade}")]
        public IEnumerable<Usuario> UsuarioGetCidade(string Cidade)
        {
            return BancoDados.RegistrosUsuario.FindAll(itemUsuario => itemUsuario.Localizacao.Cidade == Cidade);
        }

        //Consulta dos registros no Banco por causa
        [HttpGet("UsuarioGetCausa/{IdCausa}")]
        public IEnumerable<Usuario> UsuarioGetCausa(int IdCausa)
        {
            List<Usuario> listaTemp = new List<Usuario>();

            foreach(Usuario item in BancoDados.RegistrosUsuario)
            {
                foreach(Causa itemCausa in item.CausasInteresse)
                {
                    if (itemCausa.Id == IdCausa)
                    {
                        listaTemp.Add(item);
                        break;
                    }
                }
            }
            return listaTemp;
        }
    }
}
