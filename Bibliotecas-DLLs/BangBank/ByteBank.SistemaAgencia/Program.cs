using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BangBank.Modelos;
using BangBank.Modelos.Funcionarios;

namespace BangBank.SistemaAgencia
{
    class Program
    {
        static void Main(string[] args)
        {
            //ContaCorrente conta = new ContaCorrente(847, 489754);
            //FuncionarioAutenticavel kleber = null;
            //kleber.Autenticar("ijodjodjd");
            //Console.WriteLine(conta.Numero);

            DateTime dataFimPagamento = new DateTime(2023,5,12);

            DateTime dataCorrente = DateTime.Now;

            TimeSpan diferenca = dataFimPagamento - dataCorrente;

            string mensagem = "Vencimento em " + GetIntervaloDeTempoLegivel(diferenca);

            Console.WriteLine(mensagem);

            Console.ReadLine();

        }
        static string GetIntervaloDeTempoLegivel(TimeSpan timeSpan)
        {
            if (timeSpan.Days > 30)
            {
                int quantidadeMeses = timeSpan.Days / 30;
                if (quantidadeMeses ==1)
                {
                    return " 1 mês ";
                }
                return quantidadeMeses + " meses ";
            }
            else if (timeSpan.Days > 7)
            {
                int quantidadeSemans = timeSpan.Days / 7;

            }
            return timeSpan.Days + " Dias ";
        }
    }
}
