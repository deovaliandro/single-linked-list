#include <stdio.h>
#include <stdlib.h>

struct Node 
{
    int data;
    struct Node *next;
    struct Node *prev;
};

void insert_beginning(struct Node **head, int data)
{
    struct Node *current = (struct Node *) malloc(sizeof(*current));
    current->data = data;
    current->prev = NULL;

    if ((*head) != NULL) {
        current->next = *head;
        (*head)->prev = current;
    } else {
        current->next = NULL;
    }
    
    *head = current;
    return;
}

void insert_end(struct Node **head, int data)
{
    struct Node *end;
    struct Node *current = (struct Node *) malloc(sizeof(*current));
    current->data = data;
    current->next = NULL;
    
    end = *head;

    while(end->next != NULL) {
        end = end->next;
    }

    if (end != NULL) {
        current->prev = end;
        end->next = current;
    } else {
        insert_beginning(&(*head), data);
        return;
    }

    return;
}

void insert_at(struct Node **head, int data, int position)
{
    if (position == 0 && (*head) == NULL) {
        insert_beginning(&(*head), data);
        return;
    } else if (position > 0 && (*head) == NULL) {
        printf("Out of range\n");
        return;
    }

    struct Node *dummy;
    struct Node *dum;
    struct Node *current = (struct Node *) malloc(sizeof(*current));
    current->data = data;
    dummy = *head;

    while (position > 1) {
        if (dummy->next == NULL && position == 1) {
            insert_end(&(*head), data);
            return;
        } else if (dummy->next == NULL && position > 1) {
            printf("Out of range\n");
            return;
        }
        dummy = dummy->next;
        position--;
    }
    dum = dummy->next;
    dummy->next = current;
    current->prev = dummy;
    current->next = dum;
    dum->prev = current;
}

void delete_beginning(struct Node **head)
{
    if (*head == NULL) {
        printf("Linked list empty\n");
        return;
    }

    if ((*head)->next == NULL) {
        *head = NULL;
        return;
    }
    
    struct Node *dummy;
    dummy = *head;
    
    *head = (*head)->next;
    (*head)->prev = NULL;
    free(dummy);

    return;
}

void print_node(struct Node *head)
{
    while (head) {
        printf("%d\n", head->data);
        head = head->next;
    }
    
}

void print_node_reverse(struct Node *head)
{
    struct Node *end = NULL;
    end = head;

    while (end->next != NULL) {
        end = end->next;
    }

    while(end) {
        printf("%d\n", end->data);
        end = end->prev;
    }
    
}

void free_all(struct Node *head)
{
    while (head) {
        struct Node *next = head->next;
        free(head);
        head = next;
    }
    
}

int main(void)
{
    struct Node *dll = NULL;
    insert_beginning(&dll, 12);
    insert_beginning(&dll, 13);
    insert_beginning(&dll, 14);
    insert_end(&dll, 11);
    insert_at(&dll, 2, 2);
    insert_at(&dll, 100, 1);
    print_node(dll);
    delete_beginning(&dll);
    puts("========");
    print_node(dll);
    // print_node_reverse(dll);
    free_all(dll);
    return 0;
}