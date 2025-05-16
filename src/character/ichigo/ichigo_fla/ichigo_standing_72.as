// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_standing_72

package ichigo_fla
{
    import flash.display.MovieClip;

    public dynamic class ichigo_standing_72 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var idle_repeat:*;

        public function ichigo_standing_72()
        {
            addFrameScript(0, this.frame1, 23, this.frame24, 47, this.frame48);
        }

        internal function frame1():*
        {
            this.idle_repeat = 0;
        }

        internal function frame24():*
        {
            if (this.idle_repeat == 3)
            {
                this.idle_repeat = 0;
                gotoAndPlay("blink");
            }
            else
            {
                this.idle_repeat++;
                gotoAndPlay("repeat");
            };
        }

        internal function frame48():*
        {
            gotoAndPlay("repeat");
        }


    }
}//package ichigo_fla

