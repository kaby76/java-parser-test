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
            try
            {
                var input = File.OpenText(args[file_index]);
                var str = new AntlrInputStream(input);
                JavaLexer lexer = new JavaLexer(str);
                tokens = new CommonTokenStream(lexer);
                var parser = new JavaParser(tokens);
                parser.RemoveErrorListeners();
                parser.AddErrorListener(errorListener);
                tree = parser.compilationUnit();
            }
            catch (Exception e)
            {
                exceptions++;
            }
            System.Console.WriteLine("errors " + errorListener.num_errors + " exceptions " + exceptions);
	        if (tree != null) System.Console.WriteLine(tree.OutputTree(tokens));
        }
    }
}
