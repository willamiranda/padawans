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
    public class TrabalhoVoluntarioController : ControllerBase
    {
        private string Verificacoes(TrabalhoVoluntario TrabalhoVoluntarioVM)
        {
            //Verifica se está sendo inserido um valor nulo
            if (TrabalhoVoluntarioVM == null)
            {
                return "Não é permitido a inserção de registros nulos.";
            }

            //Verifica se o usuário está cadastrado
            if (!BancoDados.RegistrosUsuario.Exists(itemUsuario => itemUsuario.Id == TrabalhoVoluntarioVM.IdUsuario)) 
            {
                return "Usuário não registrado.";
            }

            //Verifica se a ONG está cadastrada
            if(!BancoDados.RegistrosONG.Exists(itemONG => itemONG.Id == TrabalhoVoluntarioVM.IdONG))
            {
                return "ONG não registrada.";
            }
            return "";
        }

        //Inserção de um registro no Banco
        [HttpPost("TrabalhoVoluntarioPost")]
        public string TrabalhoVoluntarioPost(TrabalhoVoluntario TrabalhoVoluntarioVM)
        {
            string mensagem = Verificacoes(TrabalhoVoluntarioVM);
            if (mensagem != "")
            {
                return mensagem;
            }
            BancoDados.RegistrosTrabalhoVoluntario.Add(TrabalhoVoluntarioVM);
            return "Trabalho voluntário registrado.";
        }

        //Consulta de todos os registros no Banco
        [HttpGet("TrabalhoVoluntarioGet")]
        public IEnumerable<TrabalhoVoluntario> TrabalhoVoluntarioGet()
        {
            return BancoDados.RegistrosTrabalhoVoluntario;
        }

        //Consulta dos registros no Banco por usuário
        [HttpGet("TrabalhoVoluntarioGetUsuario/{IdUsuario}")]
        public IEnumerable<TrabalhoVoluntario> TrabalhoVoluntarioGetUsuario(int IdUsuario)
        {
            return BancoDados.RegistrosTrabalhoVoluntario.FindAll(itemTrabVol => itemTrabVol.IdUsuario == IdUsuario);
        }

        //Consulta dos registros no Banco de ONG
        [HttpGet("TrabalhoVoluntarioGetONG/{IdONG}")]
        public IEnumerable<TrabalhoVoluntario> TrabalhoVoluntarioGetONG(int IdONG)
        {
            return BancoDados.RegistrosTrabalhoVoluntario.FindAll(itemTrabVol => itemTrabVol.IdONG == IdONG);
        }
    }
}
