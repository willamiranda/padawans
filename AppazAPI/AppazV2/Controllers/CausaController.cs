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
    public class CausaController : ControllerBase
    {
        private string Verificacoes(Causa CausaVM)
        {
            //Verifica se está sendo inserido um valor nulo
            if (CausaVM == null)
            {
                return "Não é permitido a inserção de registros nulos.";
            }
            return "";
        }

        //Inserção de um registro no Banco
        [HttpPost("CausaPost")]
        public string CausaPost(Causa CausaVM)
        {
            string mensagem = Verificacoes(CausaVM);
            if (mensagem != "")
            {
                return mensagem;
            }
            BancoDados.RegistrosCausa.Add(CausaVM);
            return "Causa registrada";
        }

        //Consulta de todos os registros no Banco
        [HttpGet("CausaGet")]
        public IEnumerable<Causa> CausaGet()
        {
            return BancoDados.RegistrosCausa;
        }
    }
}
