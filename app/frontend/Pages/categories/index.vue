<template>
    <v-container
        class="spacing-playground pa-6"
        fluid
    >
        <v-row>
            <v-col
                class="d-flex align-center"
                cols="12"
                sm="6"
            >
                <v-select
                    label="Select"
                    :items="['California', 'Colorado', 'Florida', 'Georgia', 'Texas', 'Wyoming']"
                    variant="solo-inverted"
                >
                <template v-slot:prepend>
                    <strong class="text-primary py-1">p</strong>
                </template>

                <template v-slot:append-outer>
                    <div class="py-1">
                    -
                    </div>
                </template>
                </v-select>

                <v-select
                    label="Select"
                    :items="['California', 'Colorado', 'Florida', 'Georgia', 'Texas', 'Wyoming']"
                    variant="solo-inverted"
                ></v-select>
            </v-col>

            <v-col
                class="d-flex"
                cols="12"
                sm="6"
            >
                <v-select
                    label="Select"
                    :items="['California', 'Colorado', 'Florida', 'Georgia', 'Texas', 'Wyoming']"
                    variant="solo-inverted"
                >
                    <template v-slot:prepend>
                        <strong class="text-primary py-1">m</strong>
                    </template>

                    <template v-slot:append-outer>
                        <div class="py-1">
                        -
                        </div>
                    </template>
                </v-select>

                <v-select
                    label="Select"
                    :items="['California', 'Colorado', 'Florida', 'Georgia', 'Texas', 'Wyoming']"
                    variant="solo-inverted"
                ></v-select>
            </v-col>
        </v-row>
        <v-row>
            <v-icon icon="mdi-video-input-component"></v-icon> &nbsp;
            Find a Graphics Card

            <v-spacer></v-spacer>

            <v-divider></v-divider>
            <v-data-table :items="items">
                <template v-slot:[`header.stock`]>
                    <div class="text-end">Stock</div>
                </template>

                <template v-slot:[`item.image`]="{ item }">
                    <v-card class="my-2" elevation="2" rounded>
                    <v-img
                        :src="`https://cdn.vuetifyjs.com/docs/images/graphics/gpus/${item.image}`"
                        height="64"
                        cover
                    ></v-img>
                    </v-card>
                </template>

                <template v-slot:[`item.rating`]="{ item }">
                    <v-rating
                    :model-value="item.rating"
                    color="orange-darken-2"
                    density="compact"
                    size="small"
                    readonly
                    ></v-rating>
                </template>

                <template v-slot:[`item.stock`]="{ item }">
                    <div class="text-end">
                    <v-chip
                        :color="item.stock ? 'green' : 'red'"
                        :text="item.stock ? 'In stock' : 'Out of stock'"
                        class="text-uppercase"
                        size="small"
                        label
                    ></v-chip>
                    </div>
                </template>
            </v-data-table>
        </v-row>
    </v-container>
</template>

<script setup>
    import { ref, defineProps, reactive } from 'vue'
    defineProps('categories');

    const search = ref('')
    const items = reactive([
        {
            name: 'Nebula GTX 3080',
            image: '1.png',
            price: 699.99,
            rating: 5,
            stock: true,
        },
        {
            name: 'Galaxy RTX 3080',
            image: '2.png',
            price: 799.99,
            rating: 4,
            stock: false,
        },
        {
            name: 'Orion RX 6800 XT',
            image: '3.png',
            price: 649.99,
            rating: 3,
            stock: true,
        },
        {
            name: 'Vortex RTX 3090',
            image: '4.png',
            price: 1499.99,
            rating: 4,
            stock: true,
        },
        {
            name: 'Cosmos GTX 1660 Super',
            image: '5.png',
            price: 299.99,
            rating: 4,
            stock: false,
        }
    ])
</script>