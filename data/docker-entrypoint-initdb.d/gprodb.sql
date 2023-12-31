PGDMP                         x           gpro    11.7    11.7 3    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ?           1262    16393    gpro    DATABASE     �   CREATE DATABASE gpro WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE gpro;
             postgres    false            �            1259    16975    category    TABLE     �   CREATE TABLE public.category (
    id bigint NOT NULL,
    description character varying(255),
    name character varying(255),
    photo character varying(255)
);
    DROP TABLE public.category;
       public         postgres    false            �            1259    16973    category_id_seq    SEQUENCE     x   CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public       postgres    false    197            @           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
            public       postgres    false    196            �            1259    16986    client    TABLE     �   CREATE TABLE public.client (
    id bigint NOT NULL,
    address character varying(255),
    email character varying(255),
    name character varying(255),
    phone_number character varying(255),
    username character varying(255)
);
    DROP TABLE public.client;
       public         postgres    false            �            1259    16984    client_id_seq    SEQUENCE     v   CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.client_id_seq;
       public       postgres    false    199            A           0    0    client_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;
            public       postgres    false    198            �            1259    16997 
   order_item    TABLE     �   CREATE TABLE public.order_item (
    id bigint NOT NULL,
    price double precision NOT NULL,
    quantity integer NOT NULL,
    order_id bigint,
    product_id bigint
);
    DROP TABLE public.order_item;
       public         postgres    false            �            1259    16995    order_item_id_seq    SEQUENCE     z   CREATE SEQUENCE public.order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.order_item_id_seq;
       public       postgres    false    201            B           0    0    order_item_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.order_item_id_seq OWNED BY public.order_item.id;
            public       postgres    false    200            �            1259    17005    orders    TABLE     �   CREATE TABLE public.orders (
    id bigint NOT NULL,
    date timestamp without time zone,
    total_amount double precision NOT NULL,
    client_id bigint,
    payment_id bigint
);
    DROP TABLE public.orders;
       public         postgres    false            �            1259    17003    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       postgres    false    203            C           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
            public       postgres    false    202            �            1259    17013    payment    TABLE     �   CREATE TABLE public.payment (
    id bigint NOT NULL,
    card_number bigint NOT NULL,
    card_type character varying(255),
    date_payment timestamp without time zone
);
    DROP TABLE public.payment;
       public         postgres    false            �            1259    17011    payment_id_seq    SEQUENCE     w   CREATE SEQUENCE public.payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.payment_id_seq;
       public       postgres    false    205            D           0    0    payment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;
            public       postgres    false    204            �            1259    17021    product    TABLE     L  CREATE TABLE public.product (
    id bigint NOT NULL,
    available boolean NOT NULL,
    current_price double precision NOT NULL,
    description character varying(255),
    name character varying(255),
    photo_name character varying(255),
    promotion boolean NOT NULL,
    selected boolean NOT NULL,
    category_id bigint
);
    DROP TABLE public.product;
       public         postgres    false            �            1259    17019    product_id_seq    SEQUENCE     w   CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public       postgres    false    207            E           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
            public       postgres    false    206            �
           2604    16978    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    16989 	   client id    DEFAULT     f   ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);
 8   ALTER TABLE public.client ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    17000    order_item id    DEFAULT     n   ALTER TABLE ONLY public.order_item ALTER COLUMN id SET DEFAULT nextval('public.order_item_id_seq'::regclass);
 <   ALTER TABLE public.order_item ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    17008 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �
           2604    17016 
   payment id    DEFAULT     h   ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);
 9   ALTER TABLE public.payment ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    205    205            �
           2604    17024 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    207    207            /          0    16975    category 
   TABLE DATA               @   COPY public.category (id, description, name, photo) FROM stdin;
    public       postgres    false    197   �7       1          0    16986    client 
   TABLE DATA               R   COPY public.client (id, address, email, name, phone_number, username) FROM stdin;
    public       postgres    false    199   �7       3          0    16997 
   order_item 
   TABLE DATA               O   COPY public.order_item (id, price, quantity, order_id, product_id) FROM stdin;
    public       postgres    false    201   �7       5          0    17005    orders 
   TABLE DATA               O   COPY public.orders (id, date, total_amount, client_id, payment_id) FROM stdin;
    public       postgres    false    203    8       7          0    17013    payment 
   TABLE DATA               K   COPY public.payment (id, card_number, card_type, date_payment) FROM stdin;
    public       postgres    false    205   8       9          0    17021    product 
   TABLE DATA               �   COPY public.product (id, available, current_price, description, name, photo_name, promotion, selected, category_id) FROM stdin;
    public       postgres    false    207   :8       F           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
            public       postgres    false    196            G           0    0    client_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.client_id_seq', 1, false);
            public       postgres    false    198            H           0    0    order_item_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);
            public       postgres    false    200            I           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
            public       postgres    false    202            J           0    0    payment_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.payment_id_seq', 1, false);
            public       postgres    false    204            K           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 30, true);
            public       postgres    false    206            �
           2606    16983    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public         postgres    false    197            �
           2606    16994    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public         postgres    false    199            �
           2606    17002    order_item order_item_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_pkey;
       public         postgres    false    201            �
           2606    17010    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         postgres    false    203            �
           2606    17018    payment payment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public         postgres    false    205            �
           2606    17029    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public         postgres    false    207            �
           2606    17040 "   orders fk17yo6gry2nuwg2erwhbaxqbs9    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk17yo6gry2nuwg2erwhbaxqbs9 FOREIGN KEY (client_id) REFERENCES public.client(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk17yo6gry2nuwg2erwhbaxqbs9;
       public       postgres    false    199    203    2727            �
           2606    17050 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public       postgres    false    2725    197    207            �
           2606    17035 &   order_item fk551losx9j75ss5d6bfsqvijna    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk551losx9j75ss5d6bfsqvijna FOREIGN KEY (product_id) REFERENCES public.product(id);
 P   ALTER TABLE ONLY public.order_item DROP CONSTRAINT fk551losx9j75ss5d6bfsqvijna;
       public       postgres    false    2735    207    201            �
           2606    17045 "   orders fkag8ppnkjvx255gj7lm3m18wkj    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkag8ppnkjvx255gj7lm3m18wkj FOREIGN KEY (payment_id) REFERENCES public.payment(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fkag8ppnkjvx255gj7lm3m18wkj;
       public       postgres    false    2733    205    203            �
           2606    17030 &   order_item fkt4dc2r9nbvbujrljv3e23iibt    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fkt4dc2r9nbvbujrljv3e23iibt FOREIGN KEY (order_id) REFERENCES public.orders(id);
 P   ALTER TABLE ONLY public.order_item DROP CONSTRAINT fkt4dc2r9nbvbujrljv3e23iibt;
       public       postgres    false    201    2731    203            /   6   x�3���t��-(-I-*r��@"E�y0c�@pnbQ�BAF~^*X0F��� 0.w      1      x������ � �      3      x������ � �      5      x������ � �      7      x������ � �      9   �  x�m�Iw�@���cr聡��AEdR��(�Q@	2����Y�؛.~�ު[�#L }�#�(c�ل��x��v��^ŭ(���Q\��CZe(��s#��-��ZF�5��R ��@��-�qO[lXȼ��Sj
`
hHAH��3�:t��j�?k�%��HU�%��):�d�x����?����,a��h�h��*�1
*��� )�T��<<?�[�@A�J
���9�G.�n��n��  �հ 5מ?�������c�?�
$V��	���9�&4�T��he	� ��P�,3���������!�~#���5�Fls�zY�*-#��Z���փ`�����Ԭs�n�Ґ���`qC�MYk�4�+��\�Q���[��)I���ư���t-��w��R�͖
-
��͖WoU�]a*8܋$T��]���4�s��h��
�"	�o��'e=�M���c��(1�iVd�W$����~^�0Փ��MY0)(1)�xh0����1�,Φ�xO�,q�����v�ꟁ�쉴w�n�!d�x�ѧZ����#0&��[`�-cďOr���ۅ�4;ශ�f���GF��乲���º���m��`�C�Qu�e��M�m?����k��U�M6vYy�4nEm�ġ��Tƭݜ$�5�ǰ�d�Ih��)�ܔ��ɲT�ו���'P�A����p����k���T{�@��	�_�|j�U�?e+\݋�ܵ���>���?���     