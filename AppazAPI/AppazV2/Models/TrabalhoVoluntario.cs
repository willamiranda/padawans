using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppazV2.Models
{
    public class TrabalhoVoluntario : Ajuda
    {
        public string Tipo { get; set; }
        public string Descricao { get; set; }
        public string DataInicio { get; set; }
        public string DataTermino { get; set; }
        public float Classificacao { get; set; }
    }
}
