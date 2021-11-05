using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppazV2.Models
{
    public class Doacao : Ajuda
    {
        public float Quantia { get; set; }
        public string DataRealizada { get; set; }
    }
}
