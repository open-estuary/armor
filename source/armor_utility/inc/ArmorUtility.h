
#ifndef _ARMOR_UTILITY_H
#define _ARMOR_UTILITY_H
/*
 *  Armor Utility Application
 *
 *  Copyright (C) 2016, Huawei UK Ltd.
 *
 *  This program is free software, you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Definitions */

/* uncomment below line for the debug logs */
/* #define ARMOR_UTIL_DEBUG */

#define ARMOR_UTIL_VER   0.1  /* version */

/* info file for supported tools */
#define ARMOR_TOOLS_INFO_FILE    "/usr/local/armor/config/armor_pkg_info.cfg"  

#define UTIL_MODULE_NAME_SIZE   512 
#define UTIL_INFO_FILE_NAME_SIZE 1024 
#define INFO_INPUT_LINE_SIZE    512
#define TOOL_NAME_SIZE  512 
#define TOOL_VER_SIZE   256 
#define TOOL_TYPE_SIZE  256 
#define TOOL_DOC_LINK_SIZE  1024

#define SUCCESS  0
#define FAIL -1

#define true 1
#define false 0

/* Declarations */

/* Structure for storing various module utility information */
struct Utils_Info_Struct 
{
    char module_name[UTIL_MODULE_NAME_SIZE]; /* store the utility's module name (for eg: "armor") */
    char info_fname[UTIL_INFO_FILE_NAME_SIZE]; /* store util's info file name */       
    char input_line[INFO_INPUT_LINE_SIZE]; /* store content of each line read from info file */
    char tool_name[TOOL_NAME_SIZE]; /* store tool's name */
    char tool_ver[TOOL_VER_SIZE]; /* store tool's version */
    char tool_type[TOOL_TYPE_SIZE]; /* store tool's type: Standard/Custom */
    char tool_doc[TOOL_DOC_LINK_SIZE]; /* store tool's document link */
    /* add here more */
};

#endif /* _ARMOR_UTILITY_H */

/************************************************ End ****************************************************/
