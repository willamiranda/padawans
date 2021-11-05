using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppazV2.Models
{
    public class Causa
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Descricao { get; set; }

        public Causa()
        {

        }

        public Causa(Causa item)
        {
            this.Id = item.Id;
            this.Nome = item.Nome;
            this.Descricao = item.Descricao;
        }
    }
}
