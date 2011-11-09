#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/IOKitLib.h>


int main (int argc, const char * argv[]) {
	CFDataRef data;	
	io_service_t platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"));
	
	if (platformExpert)
	{
		data = IORegistryEntryCreateCFProperty(platformExpert, CFSTR("system-type"), kCFAllocatorDefault, 0);
	}
	IOObjectRelease(platformExpert);
	// Grab the Bytes
	CFIndex bufferLength = CFDataGetLength(data);  
	UInt8 *buffer = malloc(bufferLength);
	CFDataGetBytes(data, CFRangeMake(0,bufferLength), (UInt8*) buffer);
	// Print for Parsing
	printf("%x\n", buffer[0]);
	// Exit with this code minus one
	return buffer[0] -1;
	
}
