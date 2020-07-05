NAME = make_file_test
CC = clang
CFLAGS = -Wall -Wextra -Werror

SRC_NAME = main.c \
			test/test.c \
			test/test2.c \
			utils/utils.c
SRC_DIR = src/
SRC = $(addprefix $(SRC_DIR), $(SRC_NAME))

OBJ_NAME = $(SRC_NAME:.c=.o)
OBJ_DIR = obj/
OBJ = $(addprefix $(OBJ_DIR), $(OBJ_NAME))

INCS = ./includes
INC = $(addprefix -I, $(INCS))
dirname = $(shell dirname $1)
all : $(NAME)

$(NAME) : $(OBJ)
	$(CC) $(CFLAGS) $(INC) -o $@ $(OBJ)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@mkdir -p $(call dirname, $@) 2> /dev/null || true
	$(CC) $(CFLAGS) $(INC) -o $@ -c $^

clean :
	rm -rf $(OBJ_DIR)

fclean : clean
	rm -rf $(NAME)

re : fclean all
