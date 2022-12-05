#Change in to the project directory
cd ansible/chrony

vim chrony.yaml

---

- name: 'Manage the chrony timeserver'
  hosts: all
  become: true
  gather_facts: false
  tasks:
    - name: 'Ensure that chrony time server is installed'
      package:
        name: 'chrony'
        state: 'present'
    - name: 'Ensure chrony time server is enabled and running'
      service:
        name: "{{ chrony_svc }}"
        state: 'started'
        enabled: true
    - name: 'Copy standard config file for chrony time server'
      copy:
        dest: "{{ chrony_conf }}"
        src: 'chrony.conf'
      notify: 'restart_chrony'
  handlers:
    - name: 'restart_chrony'
      service:
        name: "{{ chrony_svc }}"
        state: 'restarted'