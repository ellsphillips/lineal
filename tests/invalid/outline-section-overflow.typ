// expect-error: section outline exceeds the available height; reduce its depth or use separate contents pages
#import "../../lib.typ": lineal-theme
#show: lineal-theme
= An oversized section
#for index in range(24) {
  heading(depth: 2)[Topic #str(index + 1): a descriptive label]
  [A normal slide.]
}
