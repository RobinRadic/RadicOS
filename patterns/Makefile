#ARGS=--explain
ARCH=x86_64
YAST_PACKS=grub2,yast2-installation,kernel-default,branding-RadicOS
FACTORY_REPO=repo-oss

all: test_minimal

test_minimal: patterns.solv factory.solv
	./run \
		--arch $(ARCH) \
		--repo patterns \
		--repo factory \
		--packs patterns-RadicOS-minimal_base@patterns \
		--packs patterns-RadicOS-minimal_base-conflicts@patterns \
		--packs "$(YAST_PACKS)" \
		$(ARGS)

patterns.solv: patterns-RadicOS/patterns-RadicOS.spec
	./createsolv
	rm -f patterns.solv
	ln -s patterns-RadicOS/patterns.solv patterns.solv

patterns-RadicOS/patterns-RadicOS.spec:
	#osc co -c home:radic:RadicOS/patterns-RadicOS

factory.solv: /var/cache/zypp/solv/$(FACTORY_REPO)/solv
	ln -s /var/cache/zypp/solv/$(FACTORY_REPO)/solv factory.solv

.PHONY: all
