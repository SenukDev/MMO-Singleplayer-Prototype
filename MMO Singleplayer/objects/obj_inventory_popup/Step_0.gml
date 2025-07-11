lifetime ++;
y -= 0.5;
if (lifetime >= lifetime_max) {
	instance_destroy(self);
}