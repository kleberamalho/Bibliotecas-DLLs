using ByteBank.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BangBank.Modelos
{
    public class ParceiroComercial : IAutenticavel
    {
        private AutenticacoHelper _autenticacoHelper = new AutenticacoHelper();
        public string Senha { get; set; }

        public bool Autenticar(string senha)
        {
            return _autenticacoHelper.CompararSenhas(Senha, senha);
        }
    }
}