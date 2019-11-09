namespace Test
{
    using System;
    using System.IO;
    using Antlr4.Runtime;
    using Antlr4.Runtime.Tree;

    public class FunctionValidate {
        public static void Main(String[] args)
        {
            bool print_tree = false;
            bool perf = false;
            bool print_tokens = false;
            int file_index = 0;
            if (args.Length == 0)
            {
                System.Console.WriteLine("Antlr Java parser.");
                return;
            }
            else
            {
                for (int i = 0; i < args.Length; ++i)
                {
                    if (args[i] == "-t")
                    {
                        print_tree = true;
                    }
                    else if (args[i] == "-p")
                    {
                        perf = true;
                    }
                    else if (args[i] == "-i")
                    {
                        print_tokens = true;
                    }
                    else
                    {
                        file_index = i;
                    }
                }
            }
            int exceptions = 0;
	        var errorListener = new ErrorListener<IToken>();
	        IParseTree tree = null;
            CommonTokenStream tokens = null;
            var start = DateTime.Now;
            try
            {
                var input = File.OpenText(args[file_index]);
                var str = new AntlrInputStream(input);
                var lexer = new Java9Lexer(str);
                tokens = new CommonTokenStream(lexer);
                var parser = new Java9Parser(tokens);
                parser.RemoveErrorListeners();
                parser.AddErrorListener(errorListener);
                tree = parser.compilationUnit();
            }
            catch (Exception e)
            {
                exceptions++;
            }
            System.Console.WriteLine("errors " + errorListener.num_errors + " exceptions " + exceptions);
            var end = DateTime.Now;
            if (perf) System.Console.WriteLine(end - start);
            if (print_tokens && tokens != null)
            {
                foreach (var token in tokens.GetTokens())
                {
                    System.Console.WriteLine("Token " + token.TokenIndex + " " + token.Type + " " + Output.PerformEscapes(token.Text));
                }
            }
            if (print_tree && tree != null) System.Console.WriteLine(tree.OutputTree(tokens));
        }
    }
}
