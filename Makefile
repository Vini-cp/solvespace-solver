.PHONY:	clean fclean re all

NAME		:=	solve

CFLAGS		:=	-I./

FLAGS		:= -lmlx -lXext -lX11

CC			:=	g++

SRC			:=	constraint.cpp \
				constrainteq.cpp \
				entity.cpp \
				expr.cpp \
				lib.cpp \
				system.cpp \
				util.cpp \
				platform/w32util.cpp
				

SRC_FOLDER 	:= src

OBJ_FOLDER	:= obj

SRCS 		:= $(addprefix ${SRC_FOLDER}/, ${SRC})

OBJS 		:= $(addprefix ${OBJ_FOLDER}/, ${SRCS:.cpp=.o})

%.o: %.c
	$(CC) $(FLAGS) -c $< -o $@ 

all: $(NAME)

$(NAME)	: $(OBJS)
	ar crs $(NAME) $(OBJS)

$(OBJ_FOLDER)/%.o: %.cpp
	@mkdir -p $(@D)
	$(CC) $(FLAGS) -c -o $@ $<

clean:
	rm -rf $(OBJ_FOLDER)

fclean: clean
	rm -rf $(NAME)

re: fclean ${NAME}