// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_finale_projectile

package 
{
    import flash.display.MovieClip;

    public dynamic class mario_finale_projectile extends MovieClip 
    {

        public var stance:firemario_finale;

        public function mario_finale_projectile()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            stop();
        }


    }
}//package 

