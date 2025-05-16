// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_walk_221

package sonic_fla
{
    import flash.display.MovieClip;

    public dynamic class sonic_walk_221 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;

        public function sonic_walk_221()
        {
            addFrameScript(40, this.frame41);
        }

        internal function frame41():*
        {
            gotoAndPlay("again");
        }


    }
}//package sonic_fla

