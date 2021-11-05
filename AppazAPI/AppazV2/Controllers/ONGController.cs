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
    public class ONGController : ControllerBase
    {
        private string Verificacoes(ONG ONGVM)
        {
            //Verifica se está sendo inserido um registro nulo
            if (ONGVM == null)
            {
                return "Não é permitido a inserção de registros nulos.";
            }

            //Verifica se o email ou cnpj já está cadastrado
            foreach (ONG item in BancoDados.RegistrosONG)
            {
                if (item.Email == ONGVM.Email || item.CNPJ == ONGVM.CNPJ)
                {
                    return "E-mail ou CNPJ já cadastrado.";
                }
            }

            //Verifica se a causa adotada já está cadastrada
            if (!BancoDados.RegistrosCausa.Exists(itemCausa => itemCausa.Id == ONGVM.CausaAdotada.Id))
            {
                return "A causa " + ONGVM.CausaAdotada.Nome + " não está cadastrada.";
            }
            return "";
        }

        //Inserção de um registro no Banco
        [HttpPost("ONGPost")]
        public string ONGPost(ONG ONGVM)
        {
            string mensagem = Verificacoes(ONGVM);
            if (mensagem != "")
            {
                return mensagem;
            }
            BancoDados.RegistrosONG.Add(ONGVM);
            return "ONG registrada";
        }

        //Consulta de todos os registros no Banco
        [HttpGet("ONGGet")]
        public IEnumerable<ONG> ONGGet()
        {
            return BancoDados.RegistrosONG;
        }

        //Consulta de um registro por Id no Banco
        [HttpGet("ONGGetId/{Id}")]
        public ONG ONGGetId(int Id)
        {
            return BancoDados.RegistrosONG.Find(itemONG => itemONG.Id == Id);
        }

        //Consulta dos registros no Banco por cidade
        [HttpGet("ONGGetCidade/{Cidade}")]
        public IEnumerable<ONG> ONGGetCidade(string Cidade)
        {
            return BancoDados.RegistrosONG.FindAll(itemONG => itemONG.Localizacao.Cidade == Cidade);
        }

        //Consulta dos registros no Banco por causa
        [HttpGet("ONGGetCausa/{Causa}")]
        public IEnumerable<ONG> ONGGetCausa(int Id)
        {
            return BancoDados.RegistrosONG.FindAll(itemONG => itemONG.CausaAdotada.Id == Id);
        }
    }
}
