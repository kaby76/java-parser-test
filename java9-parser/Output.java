import java.util.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CodePointCharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNodeImpl;
import java.util.regex.Pattern;
import java.io.File;
import java.lang.reflect.*;

public class Output
{
    private static int changed = 0;
    private static boolean first_time = true;

    public static StringBuilder OutputTree(ParseTree tree, CommonTokenStream stream)
    {
        var sb = new StringBuilder();
        ParenthesizedAST(tree, sb, stream, 0);
        return sb;
    }

    private static void ParenthesizedAST(ParseTree tree, StringBuilder sb, CommonTokenStream stream, int level)
    {
        // Antlr always names a non-terminal with first letter lowercase,
        // but renames it when creating the type in C#. So, remove the prefix,
        // lowercase the first letter, and remove the trailing "Context" part of
        // the name. Saves big time on output!
        if (tree instanceof TerminalNodeImpl)
        {
            TerminalNodeImpl tok = (TerminalNodeImpl) tree;
            var interval = tok.getSourceInterval();
            var inter = stream.getHiddenTokensToLeft(tok.symbol.getTokenIndex());
            if (inter != null)
                for (var t : inter)
                {
                    StartLine(sb, tree, stream, level);
                    sb.append("( HIDDEN text=" + PerformEscapes(t.getText()));
                    sb.append(System.lineSeparator());
                }
            StartLine(sb, tree, stream, level);
            sb.append("( TOKEN i=" + tree.getSourceInterval().a
                    + " txt=" + PerformEscapes(tree.getText())
                    + " tt=" + tok.getSymbol().getType());
            sb.append(System.lineSeparator());
        }
        else
        {
            var fixed_name = tree.getClass().getName().toString()
                    .replace("JavaParser$", "");
            fixed_name = fixed_name.replaceAll("^.*[+]", "");
            fixed_name = fixed_name.substring(0, fixed_name.length() - "Context".length());
            fixed_name = Character.toString(fixed_name.charAt(0)).toLowerCase()
                    + fixed_name.substring(1);
            StartLine(sb, tree, stream, level);
            sb.append("( " + fixed_name);
            sb.append(System.lineSeparator());
        }
        for (int i = 0; i < tree.getChildCount(); ++i)
        {
            var c = tree.getChild(i);
            ParenthesizedAST(c, sb, stream, level + 1);
        }
        if (level == 0)
        {
            for (int k = 0; k < 1 + changed - level; ++k) sb.append(") ");
                sb.append(System.lineSeparator());
            changed = 0;
        }
    }

    private static void StartLine(StringBuilder sb, ParseTree tree, CommonTokenStream stream, int level)
    {
        if (changed - level >= 0)
        {
            if (!first_time)
            {
                for (int j = 0; j < level; ++j) sb.append("  ");
                for (int k = 0; k < 1 + changed - level; ++k) sb.append(") ");
                sb.append(System.lineSeparator());
            }
            changed = 0;
            first_time = false;
        }
        changed = level;
        for (int j = 0; j < level; ++j) sb.append("  ");
    }

    private static String ToLiteral(String input)
    {
        var literal = input;
        literal = literal.replace("\\", "\\\\");
        literal = input.replace("\b", "\\b");
        literal = literal.replace("\n", "\\n");
        literal = literal.replace("\t", "\\t");
        literal = literal.replace("\r", "\\r");
        literal = literal.replace("\f", "\\f");
        literal = literal.replace("\"", "\\\"");
        literal = literal.replace(String.format("\" +{0}\t\"", "\n"), "");
        return literal;
    }

    public static String PerformEscapes(String s)
    {
        StringBuilder new_s = new StringBuilder();
        new_s.append(ToLiteral(s));
        return new_s.toString();
    }
}

