#ifndef COMMAND_PARSER_H
#define COMMAND_PARSER_H

#include <string>
#include <vector>

struct command_parse 
{
    std::string command;
    std::vector<std::string> args;
};

command_parse parse_command(const std::string& input);

#endif // COMMAND_PARSER_H