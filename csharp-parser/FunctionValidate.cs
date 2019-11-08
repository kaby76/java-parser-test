namespace Test
{
    using System;
    using System.IO;
    using Antlr4.Runtime;

    public class FunctionValidate {
        public static void Main(String[] args)
        {
            if (args.Length == 0)
            {
                System.Console.WriteLine("Antlr Java parser.");
                return;
            }
            int exceptions = 0;
            var errorListener = new ErrorListener<IToken>();
            try
            {
                var input = File.OpenText(args[0]);
                var str = new AntlrInputStream(input);
                JavaLexer lexer = new JavaLexer(str);
                var tokens = new CommonTokenStream(lexer);
                var parser = new JavaParser(tokens);
                parser.RemoveErrorListeners();
                parser.AddErrorListener(errorListener);
                var tree = parser.compilationUnit();
            }
            catch (Exception e)
            {
                exceptions++;
            }
            System.Console.WriteLine("errors " + errorListener.num_errors + " exceptions " + exceptions);
        }
    }
}
