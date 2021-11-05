using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppazV2.Models
{
    public class BancoDados
    {
        public static List<Usuario> RegistrosUsuario = new List<Usuario>();
        public static List<Causa> RegistrosCausa = new List<Causa>();
        public static List<ONG> RegistrosONG = new List<ONG>();
        public static List<Ajuda> RegistrosAjuda = new List<Ajuda>();
        public static List<TrabalhoVoluntario> RegistrosTrabalhoVoluntario = new List<TrabalhoVoluntario>();
        public static List<Doacao> RegistrosDoacao = new List<Doacao>();
    }
}
