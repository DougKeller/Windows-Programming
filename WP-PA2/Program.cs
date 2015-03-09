// Douglas Keller
// dwk24@zips.uakron.edu
// Windows Programming
// Assignment 2

using System;
using System.IO;

namespace winsh
{
    class Winsh
    {
        // winshPath contains the path to the current directory.
        // This value is assigned in the constructor.
        string winshPath;

        // Sets the default winsh directory upon creation.
        public Winsh()
        {
            winshPath = Directory.GetCurrentDirectory();
        }
        
        // Runs until the user exits the program.
        public void run()
        {
            bool running = true;

            // Loop until the program is closed or exitted.
            while (running)
            {
		Console.ForegroundColor = ConsoleColor.DarkCyan;
                Console.Write(displayPath() + ">");
		Console.ResetColor();

                // Store all input into an array of strings for command and arguments.
                string input = Console.ReadLine();
                string[] cmd = input.Split(' ');

                // Ensure the array has elements before accessing data.
                if (cmd.Length != 0)
                {
                    // Find the command using only lower-case letters.
                    try
                    {
                        switch (cmd[0].ToLower())
                        {
                            case "man":
                                man(cmd);
                                break;
                            case "ls":
                                ls(cmd);
                                break;
                            case "more":
                                more(cmd);
                                break;
                            case "cp":
                                cp(cmd);
                                break;
                            case "grep":
                                grep(cmd);
                                break;
                            case "cd":
                                cd(cmd);
                                break;
                            case "mkdir":
                                mkdir(cmd);
                                break;
                            case "rmdir":
                                rmdir(cmd);
                                break;
                            //case "rm":
                               // I omitted the implementation for this function because my antivirus kept deleting
                               // the .exe every time I tried compiling it. I still implemented 5 additional cmds.
                               // rm(cmd);
                            //    break;
                            case "mv":
                                mv(cmd);
                                break;
                            case "touch":
                                touch(cmd);
                                break;
                            case "exit":
                                running = false;
                                break;
                            default:
                                Console.WriteLine("\'{0}\' is not a recognized command.", cmd[0]);
                                break;
                        }
                    }
                    catch (Exception e)
                    {
		        Console.WriteLine(e.Message);
                        Console.WriteLine("Unable to execute command: \'{0}\'", input);
                    }
                }

                Console.WriteLine("");
            }
        }

        // RTFM!!!
        // Provides usage information for implemented commands.
        private void man(String[] args)
        {
            // Display information on each command.
            if (args.Length == 1)
            {
                Console.WriteLine("For more information on a particular command, use \'man {arg}\'");
                Console.WriteLine("ls\tList a directory.");
                Console.WriteLine("more\tView file one screen at a time.");
                Console.WriteLine("cp\tCopy a file or directory.");
                Console.WriteLine("grep\tFind regular expression in file.");
                Console.WriteLine("cd\tChange the current directory.");
                Console.WriteLine("mkdir\tCreate a new directory.");
                Console.WriteLine("rmdir\tDelete an existing directory.");
                //Console.WriteLine("rm\tDelete an existing file.");
                Console.WriteLine("mv\tMoves or renames a file.");
                Console.WriteLine("touch\tCreates a new file.");
                Console.WriteLine("exit\tAborts current process.");
            }
            else
            {
                // Display help for given command name.
                switch (args[1])
                {
                    case "ls":
                        Console.WriteLine("ls\n\tDisplay all files and directories within the current directory.\nls {path}\n\tDisplay all the files and directories within the directory located at {path}.");
                        break;
                    case "more":
                        Console.WriteLine("more {filename}\n\tRead information from {filename}.");
                        break;
                    case "cp":
                        Console.WriteLine("cp {file1} {file2}\n\tCopy {file1} and name the copy {file2}.");
                        break;
                    case "grep":
                        Console.WriteLine("grep {regex} {file}\n\tSearch {file} for regex.");
                        break;
                    case "cd":
                        Console.WriteLine("cd {path}\n\tChange current directory to {path}.\n\tIf no path is specified, sets the directory to the default winsh directory.");
                        break;
                    case "mkdir":
                        Console.WriteLine("mkdir {name}\n\tCreate a directory named {name} in the current directory.");
                        break;
                    case "rmdir":
                        Console.WriteLine("rmdir {-r} {name}\n\tDelete a directory named {name}. Deletes all subfiles/folders if '-r' flag is used.");
                        break;
                    //case "rm":
                    //    Console.WriteLine("rm {filename}\n\tDeletes a file named {filename}.");
                    //    break;
                    case "mv":
                        Console.WriteLine("mv {file1path} {file2path}\n\tMoves or renames {file1} to {file2}.");
                        break;
                    case "touch":
                        Console.WriteLine("touch {filename}\n\tCreates a new file with the name {filename}.");
                        break;
                    default:
                        Console.WriteLine("\'{0}\' is not a recognized command.", args[1]);
                        break;
                }
            }
        }

        // Directory information.
        private void ls(String[] args)
        {
            string dir;

            if (args.Length == 1)
                dir = Directory.GetCurrentDirectory();
            else if (Directory.Exists(args[1]))
                dir = args[1];
            else
            {
                Console.WriteLine("Could not find the path specified.");
                return;
            }

            Console.WriteLine(" Directory of {0}\n\nType\tName\n", displayPath(dir));
            foreach (string d in Directory.GetDirectories(dir))
                Console.WriteLine("D\t{0}", d.Replace(dir + '\\', ""));

            foreach (string f in Directory.GetFiles(dir))
                Console.WriteLine("F\t{0}", f.Replace(dir + '\\', ""));
        }

        // Outputs text information of the filename specified.
        private void more(String[] args)
        {
            if(args.Length == 0)
                Console.WriteLine("No filename specified.");
            else if (File.Exists(args[1]))
            {
                try
                {
                    StreamReader fs = new StreamReader(args[1]);
                    string output = fs.ReadToEnd();

                    Console.WriteLine(output);
                    fs.Close();
                }
                catch (Exception e)
                {
		    Console.WriteLine(e.Message);
                    Console.WriteLine("Unable to read \'{0}\'.", args[1]);
                }
            }
            else
            {
                Console.WriteLine("No filename specified.");
            }
        }

        // Copies a file to a given filename.
        private void cp(String[] args)
        {
            if (args.Length < 3)
                Console.WriteLine("Not enough arguments specified. cp {file1_source} {file2_destination}");
            else
            {
                if (File.Exists(args[1]))
                    File.Copy(args[1], args[2]);
                else
                    Console.WriteLine("Filename \'{0}\' not found.", args[1]);
            }
        }

        // Searches a file for a given argument.
        private void grep(String[] args)
        {
            if (args.Length < 3)
                Console.WriteLine("Not enough arguments specified. grep {regex} {filename}");
            else
            {
                if (File.Exists(args[2]))
                {
                    StreamReader fs = new StreamReader(args[2]);

                    while (!fs.EndOfStream)
                    {
                        string line = fs.ReadLine();
                        if(line.Contains(args[1]))
                            Console.WriteLine(line);
                    }

                    fs.Close();
                }
                else
                    Console.WriteLine("Filename \'{0}\' not found.", args[2]);
            }
        }

        // Changes the current directory.
        private void cd(String[] args)
        {
            if (args.Length == 1 || args[1].ToLower() == "winsh")
                Directory.SetCurrentDirectory(winshPath);
            else
            {
                // Appends all arguments to one string.
                // This allows the user to enter a path that includes spaces.
                string arg = "";
                for (int i = 1; i < args.Length; ++i)
                    arg += args[i] + ' ';
                if (Directory.Exists(arg))
                    Directory.SetCurrentDirectory(arg);
                else
                    Console.WriteLine("Could not find the path specified.");
            }
        }

        // Creates a new directory at the specified path.
        private void mkdir(String[] args)
        {
            if (args.Length == 1)
                Console.WriteLine("No directory name specified.");
            else
            {
                // Appends all arguments to one string.
                // This allows the user to enter a path that includes spaces.
                string arg = "";
                for (int i = 1; i < args.Length; ++i)
                    arg += args[i] + ' ';
                Directory.CreateDirectory(Directory.GetCurrentDirectory() + '\\' + arg);
            }
        }

        // Deletes a directory. Allows use of -r recursive flag.
        private void rmdir(String[] args)
        {
            if (args.Length == 1)
                Console.WriteLine("No directory name specified.");
            else
            {
                // Appends all arguments to one string.
                // This allows the user to enter a path that includes spaces.
                string arg = "";
                for (int i = (args[1] == "-r") ? 2 : 1; i < args.Length; ++i)
                    arg += args[i] + ' ';


                if (Directory.Exists(arg))
                {

                    try
                    {
                        if (args[1] == "-r")
                        {
                            Directory.Delete(arg, true);
                            return;
                        }
                        Directory.Delete(arg, false);
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                        Console.WriteLine("Unable to delete '{0}'. This directory contains data. Try using the command 'rmdir -r {0}' to recursively delete the directory.", args[1]);
                    }
                }
                else
                    Console.WriteLine("Could not find the path specified.");
            }
        }

        // OMITTED DUE TO ANTIVIRUS BEING A DERP
        /*
        private void rm(string[] args)
        {
            if (args.Length == 1)
                Console.WriteLine("Not enough arguments specified. rm {filename}");
            else
                File.Delete(args[1]);
        }
         * */

        // Moves or renames a file.
        private void mv(String[] args)
        {
            if (args.Length < 3)
                Console.WriteLine("Not enough arguments specified. mv {file1path} {file2path}");
            else if (args[1] == args[2])
                Console.WriteLine("Could not overwrite destination of same name.");
            else if (File.Exists(args[1]))
            {
                if (File.Exists(args[2]))
                    File.Replace(args[1], args[2], null);
                File.Move(args[1], args[2]);
            }
            else
                Console.WriteLine("Could not find the file specified: {0}", args[1]);
        }

        // Creates a new file.
        private void touch(String[] args)
        {
            if (args.Length == 1)
                Console.WriteLine("Not enough arguments specified. touch {filename}");
            else
            {
                if(File.Exists(args[1]))
                    Console.WriteLine("A file with the name '{0}' already exists.", args[1]);
                else
                    File.Create(args[1]);
            }
        }

        // Returns a string that omits the default directory string for the sake of cleanliness.
        // This is only used for the output.
        private string displayPath()
        {
            return Directory.GetCurrentDirectory().Replace(winshPath, "winsh");
        }

        // Used for the 'ls' command, since the directory isn't changed, only viewed.
        private string displayPath(string path)
        {
            return path.Replace(winshPath, "winsh");
        }

        // Main funciton.
        static void Main(string[] args)
        {
            Winsh shell = new Winsh();
            shell.run();
        }
    }
}
