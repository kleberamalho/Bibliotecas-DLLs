using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BangBank.Modelos
{
    public interface IAutenticavel
    {
        bool Autenticar(string senha);
    }
}
