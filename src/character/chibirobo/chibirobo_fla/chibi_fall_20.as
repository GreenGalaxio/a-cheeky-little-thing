// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_fall_20

package chibirobo_fla
{
    import flash.display.MovieClip;

    public dynamic class chibi_fall_20 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;

        public function chibi_fall_20()
        {
            addFrameScript(7, this.frame8);
        }

        internal function frame8():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package chibirobo_fla

