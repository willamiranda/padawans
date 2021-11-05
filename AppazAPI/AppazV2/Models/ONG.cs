using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppazV2.Models
{
    public class ONG
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string CNPJ { get; set; }
        public string Email { get; set; }
        public string Telefone { get; set; }
        public Endereco Localizacao { get; set; }
        public string ResponsavelSocial { get; set; }
        public Causa CausaAdotada { get; set; }
        public string AnoFundacao { get; set; }
        public float Classificacao { get; set; }
    }
}
