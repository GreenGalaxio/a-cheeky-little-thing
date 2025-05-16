// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jiggly_restEffect

package 
{
    import flash.display.MovieClip;

    public dynamic class jiggly_restEffect extends MovieClip 
    {

        public function jiggly_restEffect()
        {
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

