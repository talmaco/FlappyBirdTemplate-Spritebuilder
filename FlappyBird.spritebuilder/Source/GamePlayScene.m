#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    timeSinceObstacle += delta;
    
    // Check to see if two seconds passed
    if (timeSinceObstacle > 2.0f) {
        // Add a new obstacle
        [self addObstacle];
        
        // Then reset the timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    [character flap];
}

@end
