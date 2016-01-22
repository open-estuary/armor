/*
 *  Armor Utility Application
 *
 *  Copyright (C) 2016, Huawei UK LTD.
 *  Author: Shiju Jose <shiju.jose@huawei.com>
 *
 *  This program is free software, you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2
 */

#include "ArmorUtility.h"

/* Definitions */

#ifdef ARMOR_UTIL_DEBUG
#define DBG_PRINT printf 
#else
#define DBG_PRINT  
#endif

#define ERR_PRINT printf 

/* Variables */
struct Utils_Info_Struct *p_utils_info = NULL; 

/* Functions */

/* Function: del_newline
 * Description: This function remove the new line. 
 * Parameters: none.
 * Returns: none
 */
void del_newline(char *s)
{
    int len = strlen(s);

    if (len > 0 && s[len-1] == '\n')  /* if there is a newline replace with '\0' */
        s[len-1] = '\0';              
    return;
}

/* Function: display_tools_info 
 * Description: This function read and print the tool's info. 
 * Parameters: module's name
 * Returns: 
 *         0 on success
 *        -1 on failure
 */
int display_tools_info()
{
   FILE* config_file = NULL;
   char *ptr = NULL;    
   int i;
    
   DBG_PRINT("+display_tools_info\n");
  
   if(strcmp(p_utils_info->module_name, "armor") == 0)
   {
       strcpy(p_utils_info->info_fname, ARMOR_TOOLS_INFO_FILE);
   } else
   {
      ERR_PRINT("ERROR: module passed is not supported \n");
      return FAIL;
   } 

   config_file = fopen(p_utils_info->info_fname ,"r");  
   if(config_file == NULL)
   {
      ERR_PRINT("ERROR: Failed open file %s!\n", p_utils_info->info_fname);
      return FAIL;
   } 
   /* print all generic information */
   printf("\n");   
   printf("****************************************************************************************\n");
   printf("*                              Armor Utility %2.1f                                       *\n",ARMOR_UTIL_VER);   
   printf("*                                                                                      *\n");
   printf("*                              Armor Tools Information                                 *\n");   
   printf("****************************************************************************************\n");
   printf("Armor Tool's Manual:\n"); 
   printf("https://github.com/open-estuary/estuary/blob/master/doc/Armor_Manual.txt.4All\n");
   
   printf("\n");
   printf("Armor Tools Basic Info:\n");
   printf("https://github.com/open-estuary/estuary/blob/master/doc/Armor_Tools_Basic_Info.txt.4All\n");

   printf("\n");
   printf("Armor Tools Test Scripts:\n");
   printf("https://github.com/open-estuary/armor/tree/master/testing/test_scripts\n");
   printf("On D02, /usr/local/armor/test_scripts\n");

   printf("\n");
   printf("********************* Supported Armor Tools *********************\n\n");
   
   memset(&p_utils_info->tool_name, 0, TOOL_NAME_SIZE);    
   memset(&p_utils_info->tool_ver, 0, TOOL_VER_SIZE);    
   memset(&p_utils_info->tool_type, 0, TOOL_TYPE_SIZE);     
   memset(&p_utils_info->tool_doc, 0, TOOL_DOC_LINK_SIZE);

   while (fgets (p_utils_info->input_line, INFO_INPUT_LINE_SIZE, config_file) != NULL )  
   {
       i = 0;
       while((' ' == p_utils_info->input_line[i]) || ('\t' == p_utils_info->input_line[i])) i++;
       if(('#' == p_utils_info->input_line[i]) ||
          (0 == strcmp(p_utils_info->input_line + i, "\n")) ||
          (0 == strcmp(p_utils_info->input_line + i, "\r\n")))
       {
           continue;
       }
       del_newline(p_utils_info->input_line);
       
       /* read tool's name */
       if((ptr = strstr(p_utils_info->input_line,"Tool:")) != NULL)
       {
          ptr = ptr + strlen("Tool:");
          strcpy(p_utils_info->tool_name, ptr);    
       } 
              
       /* read tool's version */
       if((ptr = strstr(p_utils_info->input_line,"Version:")) != NULL)
       {
          ptr = ptr + strlen("Version:");
          strcpy(p_utils_info->tool_ver, ptr);    
       } 

       /* read tool's type(standard/custom) */
       if((ptr = strstr(p_utils_info->input_line,"Type:")) != NULL)
       {
          ptr = ptr + strlen("Type:");
          strcpy(p_utils_info->tool_type, ptr);    
       }

       /* read tool's document info if any */
       if((ptr = strstr(p_utils_info->input_line,"Documents:")) != NULL)
       {
          /* read tool's documents link */
          if(fgets (p_utils_info->input_line, INFO_INPUT_LINE_SIZE, config_file) != NULL)
          {           
               i = 0;
               while((' ' == p_utils_info->input_line[i]) || ('\t' == p_utils_info->input_line[i])) i++;
               if((p_utils_info->input_line[i] == '#') ||
                  (strcmp(p_utils_info->input_line + i, "\n") == 0) ||
                  (strcmp(p_utils_info->input_line + i, "\r\n") == 0))
               {                   
                   continue;
               }
               del_newline(p_utils_info->input_line);
               strcpy(p_utils_info->tool_doc, p_utils_info->input_line);
          }
       }

       /* read tool's installation commands */
       if((ptr = strstr(p_utils_info->input_line,"Installation Commands:")) != NULL)
       {
           /* print tool's info */
           printf("\n======================================================\n");
           printf("[Tool:%s][Version:%s][Type:%s]\n", p_utils_info->tool_name,
                   p_utils_info->tool_ver, p_utils_info->tool_type);

           if((strcmp(p_utils_info->tool_doc, "\0")) != 0)
           {
               printf("Documents:\n");
               printf("%s\n", p_utils_info->tool_doc);
           }
 
           printf("%s\n", ptr);

           /* read and print installation commands */
           while (!feof(config_file))  
           {
               /* check for tool's info read completely */
               if(fgets (p_utils_info->input_line, INFO_INPUT_LINE_SIZE, config_file) == NULL)
               {
                   printf("===================================================");
                   break;
               }  
               i = 0;
               while((' ' == p_utils_info->input_line[i]) || ('\t' == p_utils_info->input_line[i])) i++;
               if((p_utils_info->input_line[i] == '#') ||
                  (strcmp(p_utils_info->input_line + i, "\n") == 0) ||
                  (strcmp(p_utils_info->input_line + i, "\r\n") == 0))
               {                   
                   memset(&p_utils_info->tool_name, 0, TOOL_NAME_SIZE);    
                   memset(&p_utils_info->tool_ver, 0, TOOL_VER_SIZE);    
                   memset(&p_utils_info->tool_type, 0, TOOL_TYPE_SIZE);
                   memset(&p_utils_info->tool_doc, 0, TOOL_DOC_LINK_SIZE);
                   printf("======================================================");
                   break;
               }
               del_newline(p_utils_info->input_line);
               printf("%s\n", p_utils_info->input_line);
           }
       }

       /* Print generic details */ 
       if(((ptr = strstr(p_utils_info->input_line,"Platforms:")) != NULL) ||
          ((ptr = strstr(p_utils_info->input_line,"Distribution:")) != NULL) ||
          ((ptr = strstr(p_utils_info->input_line,"Supported Boards:")) != NULL) ||
          ((ptr = strstr(p_utils_info->input_line,"Supported Architectures:")) != NULL))   
       {
           printf("%s\n", p_utils_info->input_line);  
       }  
   } /* while */
   fclose(config_file); 
   printf("\n************************* End of Armor Tool's Information **************************\n");
   DBG_PRINT("-display_tools_info\n");
   return SUCCESS;
}

/* Function: search_and_display_tool_info
 * Description: This function searches for the tool's info 
 * requested by the user, read and print. 
 * Parameters: tool's name
 * Returns: 
 *         0 on success
 *        -1 on failure
 */
int search_and_display_tool_info()
{
   FILE* config_file = NULL;
   char *ptr = NULL;    
   int i;
   int is_done = false;
   int is_tool_found = false;
    
   DBG_PRINT("+search_and_display_tool_info\n");
  
   if(strcmp(p_utils_info->module_name, "armor") == 0)
   {
       strcpy(p_utils_info->info_fname, ARMOR_TOOLS_INFO_FILE);
   } else
   {
      ERR_PRINT("ERROR: module passed is not supported \n");
      return FAIL;
   }

   config_file = fopen(p_utils_info->info_fname ,"r");  
   if(config_file == NULL)
   {
      ERR_PRINT("ERROR: Failed open file %s!\n", p_utils_info->info_fname);
      return FAIL;
   }
   printf("\n");   
   printf("****************************************************************************************\n");
   printf("*                              Armor Utility %2.1f                                       *\n",ARMOR_UTIL_VER);   
   printf("*                                                                                      *\n");
   printf("*                              Armor Tool's Information                                *\n");   
   printf("****************************************************************************************\n");

   while (fgets (p_utils_info->input_line, INFO_INPUT_LINE_SIZE, config_file) != NULL )  
   {
       if((is_tool_found == true) && (is_done == true))
       {
           break;
       }
       i = 0;
       while((' ' == p_utils_info->input_line[i]) || ('\t' == p_utils_info->input_line[i])) i++;
       if(('#' == p_utils_info->input_line[i]) ||
          (0 == strcmp(p_utils_info->input_line + i, "\n")) ||
          (0 == strcmp(p_utils_info->input_line + i, "\r\n")))
       {
           continue;
       }
       del_newline(p_utils_info->input_line);
       
       /* read tool's name */
       if((ptr = strstr(p_utils_info->input_line,"Tool:")) != NULL)
       {
          ptr = ptr + strlen("Tool:");
          if((strcmp(ptr, p_utils_info->tool_name)) == 0)
          {
              DBG_PRINT ("tool %s found \n", p_utils_info->tool_name);
              is_tool_found = true;
              strcpy(p_utils_info->tool_name, ptr);
              continue;    
          }
       } 
       if(is_tool_found == true)
       {       
           /* read tool's version */
           if((ptr = strstr(p_utils_info->input_line,"Version:")) != NULL)
           {
               ptr = ptr + strlen("Version:");
               strcpy(p_utils_info->tool_ver, ptr);    
           } 

           /* read tool's type(standard/custom) */
           if((ptr = strstr(p_utils_info->input_line,"Type:")) != NULL)
           {
               ptr = ptr + strlen("Type:");
               strcpy(p_utils_info->tool_type, ptr);    
           }

           /* read tool's document info if any */
           if((ptr = strstr(p_utils_info->input_line,"Documents:")) != NULL)
           {
               /* read tool's documents link */
               if(fgets (p_utils_info->input_line, INFO_INPUT_LINE_SIZE, config_file) != NULL)
               {           
                   i = 0;
                   while((' ' == p_utils_info->input_line[i]) || ('\t' == p_utils_info->input_line[i])) i++;
                   if((p_utils_info->input_line[i] == '#') ||
                      (strcmp(p_utils_info->input_line + i, "\n") == 0) ||
                      (strcmp(p_utils_info->input_line + i, "\r\n") == 0))
                   {                   
                       continue;
                   }
                   del_newline(p_utils_info->input_line);
                   strcpy(p_utils_info->tool_doc, p_utils_info->input_line);
               }
           }

           /* read tool's installation commands */
           if((ptr = strstr(p_utils_info->input_line,"Installation Commands:")) != NULL)
           {
                /* print tool's info */
                printf("===========================================\n");
                printf("[Tool:%s][Version:%s][Type:%s]\n", p_utils_info->tool_name,
                        p_utils_info->tool_ver, p_utils_info->tool_type);
                if((strcmp(p_utils_info->tool_doc, "\0")) != 0)
                {
                    printf("Documents:\n");
                    printf("%s\n", p_utils_info->tool_doc);
                }
                printf("%s\n", ptr);
                 
               /* read and print installation commands */
               while (!feof(config_file))  
               {
                   /* check for tool's info read completely */
                   if(fgets (p_utils_info->input_line, INFO_INPUT_LINE_SIZE, config_file) == NULL)
                   {
                       printf("===========================================\n");
                       is_done = true;
                       break;
                   }  
                   i = 0;
                   while((' ' == p_utils_info->input_line[i]) || ('\t' == p_utils_info->input_line[i])) i++;
                   if((p_utils_info->input_line[i] == '#') ||
                      (strcmp(p_utils_info->input_line + i, "\n") == 0) ||
                      (strcmp(p_utils_info->input_line + i, "\r\n") == 0))
                   {                   
                       is_done = true;
                       printf("===========================================\n");
                       break;
                   }
                   del_newline(p_utils_info->input_line);
                   printf("%s\n", p_utils_info->input_line);
               } /* while */
           }
       } /* if(is_tool_found == true) */  
   } /* while */    
   fclose(config_file); 
   if(is_tool_found == false)
   {
       printf("Info for %s Not Found. Not supported in Armor!!!\n", p_utils_info->tool_name);
   }
   DBG_PRINT("-search_and_display_tool_info\n");
   return SUCCESS;
}

/* Function: main
 * Description: main function. 
 * Parameters: 
            : component's name. Eg: armor or docker etc. 
 * Returns: 
 *        0 on success
 *        -1 on failure
 */
/* definitions */
int main( int argc, char * argv[])

{
   int result = SUCCESS;

   printf("Usage: ./armor_utility OR ./armor_utility <tool's name to search> \n");

   p_utils_info = (struct Utils_Info_Struct *) malloc(sizeof(struct Utils_Info_Struct)); 
   if(p_utils_info == NULL)
   {   
      ERR_PRINT("ERROR: p_utils_info memory allocation failed \n");
      return FAIL;
   }
   strcpy(p_utils_info->module_name, "armor"); /* default component as armor, but can be extended in the future */
   if(argc == 1)
   {
      result = display_tools_info();
   } else if (argc == 2)
   { 
      strcpy(p_utils_info->tool_name, argv[1]);    
      result = search_and_display_tool_info();
      
   }   
   free(p_utils_info);
   
   return result;
}

