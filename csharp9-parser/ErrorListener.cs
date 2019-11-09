namespace Test
{
    using Antlr4.Runtime;
    using System.IO;

    public class ErrorListener<T> : ConsoleErrorListener<T>
    {
        public int num_errors;

        public override void SyntaxError(TextWriter output, IRecognizer recognizer, T offendingSymbol, int line, int charPositionInLine, string msg, RecognitionException e)
        {
            num_errors++;
            base.SyntaxError(output, recognizer, offendingSymbol, line, charPositionInLine, msg, e);
        }
    }
}
