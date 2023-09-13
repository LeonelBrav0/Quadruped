#include "command_parser.h"
#include <sstream>

command_parse parse_command(const std::string& input) 
{
    command_parse result;
    std::istringstream iss(input);

    iss >> result.command;
    std::string arg;
    while (iss >> arg) 
    {
        result.args.push_back(arg);
    }

    return result;
}