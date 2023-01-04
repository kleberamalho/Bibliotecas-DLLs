using BangBank.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BangBank.SistemaInterno
{
     class Program
    {
        static void Main(string[] args)
        {
            ContaCorrente conta = new ContaCorrente(458, 455789);
            Console.WriteLine(conta.Saldo);

            conta.Sacar(-10);
            string nome = "Kleber";

            Console.ReadLine();
        }
    }
}
