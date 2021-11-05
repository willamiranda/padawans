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
    public class DoacaoController : ControllerBase
    {
        private string Verificacao(Doacao DoacaoVM)
        {
            //Verifica se está sendo inserido valor nulo
            if (DoacaoVM == null)
            {
                return "Não é permitido a inserção de registros nulos.";
            }

            //Verifica se o usuário está cadastrado
            if (!BancoDados.RegistrosUsuario.Exists(itemUsuario => itemUsuario.Id == DoacaoVM.IdUsuario))
            {
                return "Usuário não registrado.";
            }

            //Verifica se a ONG está cadastrada
            if (!BancoDados.RegistrosONG.Exists(itemONG => itemONG.Id == DoacaoVM.IdONG))
            {
                return "ONG não registrada.";
            }
            return "";
        }

        //Inserção de um registro no Banco
        [HttpPost("DoacaoPost")]
        public string DoacaoPost(Doacao DoacaoVM)
        {
            string mensagem = Verificacao(DoacaoVM);
            if (mensagem != "")
            {
                return mensagem;
            }
            BancoDados.RegistrosDoacao.Add(DoacaoVM);
            return "Doação registrada.";
        }

        //Consulta de todos os registros no Banco
        [HttpGet("DoacaoGet")]
        public IEnumerable<Doacao> DoacaoGet()
        {
            return BancoDados.RegistrosDoacao;
        }

        //Consulta dos registros do Banco por usuário
        [HttpGet("DoacaoGetUsuario/{IdUsuario}")]
        public IEnumerable<Doacao> DoacaoGetUsuario(int IdUsuario)
        {
            return BancoDados.RegistrosDoacao.FindAll(itemDoacao => itemDoacao.IdUsuario == IdUsuario);
        }

        //Consulta dos registros do Banco por ONG
        [HttpGet("DoacaoGetONG/{IdONG}")]
        public IEnumerable<Doacao> DoacaoGetONG(int IdONG)
        {
            return BancoDados.RegistrosDoacao.FindAll(itemDoacao => itemDoacao.IdONG == IdONG);
        }
    }
}
