# Basic Performance check commands

_CPU usage_

```bash
echo "CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"
```
```bash
```

